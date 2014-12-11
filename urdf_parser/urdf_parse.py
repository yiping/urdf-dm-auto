import xml.etree.ElementTree as ET
import numpy as np
from scipy import *
from scipy.linalg import *
from math import cos, sin
from computation import *
from collections import deque
import os

from humanoid_tree import Link, HumanoidTree

def dm_string_generator(link):
    
    if link.tree_level == 0:
        link.dm_string = """
MobileBaseLink {
    Name    "%s"
    Graphics_Model    "%s"
    Mass    %6.3f
    Inertia     %10.6f %10.6f %10.6f 
                %10.6f %10.6f %10.6f 
                %10.6f %10.6f %10.6f
    Center_of_Gravity    %10.6f %10.6f %10.6f
    Number_of_Contact_Points	0
    Position	2.000000	2.000000	0.980000	
    Orientation_Quat	0.000000	0.000000	0	1
    Velocity 0 0 0 0 0 0
}
""" % (link.name, link.mesh_name, link.mass,
           link.inertia[0,0], link.inertia[0,1], link.inertia[0,2],
           link.inertia[1,0], link.inertia[1,1], link.inertia[1,2],
           link.inertia[2,0], link.inertia[2,1], link.inertia[2,2],
           link.cg[0], link.cg[1], link.cg[2])
    else:
        link.dm_string = """
RevoluteLink {
    Name    "%s"
    Graphics_Model    "%s"
    Mass    %6.3f
    Inertia    %10.6f %10.6f %10.6f 
               %10.6f %10.6f %10.6f 
               %10.6f %10.6f %10.6f
    Center_of_Gravity    %10.6f %10.6f %10.6f
    Number_of_Contact_Points	0
    MDH_Parameters	 %6.4f    %11.8f    %6.4f    %11.8f
    Initial_Joint_Velocity	0
    Joint_Limits	0	0
    Joint_Limit_Spring_Constant	0
    Joint_Limit_Damper_Constant	0
    Actuator_Type	0
    Joint_Friction	0
}

"""  % (link.name, link.mesh_name, link.mass,
           link.inertia[0,0], link.inertia[0,1], link.inertia[0,2],
           link.inertia[1,0], link.inertia[1,1], link.inertia[1,2],
           link.inertia[2,0], link.inertia[2,1], link.inertia[2,2],
           link.cg[0], link.cg[1], link.cg[2],
           link.mdh_params[0], link.mdh_params[1], link.mdh_params[2], link.mdh_params[3])

        if abs(link.mdh_zscrew_params[0])>1e-10 or abs(link.mdh_zscrew_params[1])>1e-10:
            zscrew_string = """
ZScrewTxLink {
    Name	"ZS_%s"
    ZScrew_Parameters    %10.6f  %11.8f	
}

""" % (link.name, link.mdh_zscrew_params[0], link.mdh_zscrew_params[1])
            link.dm_string = zscrew_string + link.dm_string

    return

def getDepth(root):
    #print '-----'
    #print root.name, type(root)
    if root == None:
        return 0

    #print root.children_cnt
    if root.children_cnt != 0:
       
        n = root.children_cnt
        #print 'n', n

        d = []
        for i in range(n):
            #print root.name, i
            #print root.children_cnt
            d.append( getDepth(root.children[i]) )
        
        depth = max(d)
        #print depth
        return (depth+1)
    else:
        return 0


def getLinkInertiaInfo(robot, link):
    #print link.name
    curr = robot.find("./link[@name='"+link.name+"']")
    meshname = curr.find("./visual/geometry/mesh").attrib['filename']
    meshname = os.path.splitext(os.path.split(meshname)[1])[0]
    meshname = "meshes/"+meshname+".xan"
    mass = float(curr.find("./inertial/mass").attrib['value'])

    #print mass

    Ixx = float(curr.find("./inertial/inertia").attrib['ixx'])
    Iyy = float(curr.find("./inertial/inertia").attrib['iyy'])
    Izz = float(curr.find("./inertial/inertia").attrib['izz'])
    Ixy = float(curr.find("./inertial/inertia").attrib['ixy'])
    Ixz = float(curr.find("./inertial/inertia").attrib['ixz'])
    Iyz = float(curr.find("./inertial/inertia").attrib['iyz'])
    Icmbar = matrix([[Ixx, Ixy, Ixz], [Ixy, Iyy, Iyz],[Ixz, Iyz, Izz]] )
    cg_str = curr.find("./inertial/origin").attrib['xyz']
    cg = [float(x) for x in cg_str.strip().split(' ')]
    rpy_str = curr.find("./inertial/origin").attrib['rpy']
    rpy = [float(x) for x in rpy_str.strip().split(' ')]

##    theta = norm(rpy)
##    if norm>0.01:
##        v = rpy/theta
##        parent_Rot_child_2 = axisAngle2Rot(v, theta)
    parent_Rot_child = rpy2Rot(rpy[0], rpy[1], rpy[2])
    #print parent_Rot_child

    link.mass = mass
    #print type(Icmbar[0,0]), type(parent_Rot_child[0,0])
    inertia = rotCongruenceTx(parent_Rot_child.T, Icmbar) # note the transpose
    link.inertia =Icmbar2Ibar(mass, inertia, cg)
    link.cg = cg
    link.mesh_name = meshname

urdf_file_name = 'atlas_urdf/atlas_v4.urdf'
tree = ET.parse(urdf_file_name)
robot = tree.getroot()

robotname = robot.attrib['name']
print 'robot name is:', robotname

joints = robot.findall(".//joint")
active_joints = []
plink_names = []
clink_names = []

for j in joints:
    if j.attrib['type']!='fixed':
        active_joints.append(j)
        plink = j.find('./parent')
        plink_names.append(plink.attrib['link'])
        clink = j.find('./child')
        clink_names.append(clink.attrib['link'])

        #print j.attrib['name'], 'parent:', plink.attrib['link'], 'child:', clink.attrib['link']

unique_link_names = list(set(plink_names+clink_names))
rootlink_name = ""
unique_links = []
rootlink = None

# process links
for uln in unique_link_names:
    link = Link(uln)
##    if link.name != 'head':
    getLinkInertiaInfo(robot, link)
    unique_links.append(link)
    if (uln in plink_names) and (uln not in clink_names):
        print 'root link is:',uln
        rootlink_name = uln
        rootlink = link

for pn, cn in zip(plink_names, clink_names) :
    parent_link = None
    child_link = None
    #print pn, cn
    for l in unique_links:
        if pn == l.name:
            parent_link = l

        if cn == l.name:
            child_link = l

    parent_link.children.append(child_link)
    parent_link.children_cnt = parent_link.children_cnt +1

# joint relations
for j in active_joints:
    child_link_name = j.find('./child').attrib['link']
    child_link = None
    for l in unique_links:
        if l.name == child_link_name:
            child_link = l
            
    str1 = j.find('./axis').attrib['xyz']
    mdh_z = [int(x) for x in str1.strip().split(' ')]
    child_link.mdh_zaxis = mdh_z

    str2 = j.find('./origin').attrib['xyz']
    str3 = j.find('./origin').attrib['rpy']
    pos_rel_plink = [float(x) for x in str2.strip().split(' ')]
    child_link.pos_rel_plink = pos_rel_plink
    rpy_rel_plink = [float(x) for x in str3.strip().split(' ')]
    child_link.rpy_rel_plink = rpy_rel_plink


# iterate humanoid tree, breadth first
rootlink.tree_level = 0
rootlink.mdh_rotation = matrix(eye(3))

d = deque([rootlink])

while len(d)>0:
    current_link = d.popleft() 
    for i in range(current_link.children_cnt):
        d.append(current_link.children[i])
        current_link.children[i].tree_level = current_link.tree_level + 1

# iterate again
d.clear()
d.append(rootlink)
while len(d)>0:
    current_link = d.popleft()
    for i in range(current_link.children_cnt):
        d.append(current_link.children[i])
        if current_link.children[i].tree_level >0 and current_link.children[i].tree_level < getDepth(rootlink)+1:
            if current_link.children != None:
                MDH_massage(current_link, current_link.children[i])
    
htree = HumanoidTree(rootlink)
htree.printTree(rootlink)
print htree.getDepth(rootlink)


# iterate again, generate dm strings

d.clear()
d.append(rootlink)
while len(d)>0:
    current_link = d.popleft()
    dm_string_generator(current_link)
    for i in range(current_link.children_cnt):
        d.append(current_link.children[i])

# assemble dm_strings
d.clear()
d.append(rootlink)

dm_prefix = """
# DynaMechs V 4.0 ascii

Articulation {
	Name	"Articulation"
	Graphics_Model		""
	Position			0	0	0
	Orientation_Quat	0	0	0	1
"""
dm_suffix = """
}
"""



def assemble_dm_string(root):
    if root == None:
        return

    if root.children_cnt > 0:
       
        n = root.children_cnt

        for i in range(n):
            assemble_dm_string( root.children[i] )
            if n>1:
                root.dm_string = root.dm_string + """Branch{
"""
            if n>1:
                ss = indent_string(4, root.children[i].dm_string)
            else:
                ss = root.children[i].dm_string
            root.dm_string = root.dm_string + ss
            
            if n>1:
                root.dm_string = root.dm_string + """
}

"""
        
    else:
        return


def indent_string(numSpace, ss):
    ssl =[ numSpace*" "+i for i in ss.splitlines()]
    return "\n".join(ssl)

assemble_dm_string(rootlink)

output_dm_string = dm_prefix+indent_string(4, rootlink.dm_string)+dm_suffix
f=open("atlas.dm",'w')
f.write(output_dm_string)
f.close()
