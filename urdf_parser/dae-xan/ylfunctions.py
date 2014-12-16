import xml.etree.ElementTree as ET

from scipy import *
from scipy.linalg import *

import ntpath

def translate2xan(dae_file_name, xan_file_name, R, pos_offset):

    tree = ET.parse(dae_file_name)
    root = tree.getroot()

    #deals with xml name space
    namespaces = {'x': 'http://www.collada.org/2005/11/COLLADASchema'}

    #xpath 1.0 limiation
    # 2.0 : a[ends-with(@id, '.jpg')]
    # [substring(@id,string-length(@id)-7)='POSITION']
    sr = root.findall("./x:library_geometries/x:geometry/x:mesh//x:source",namespaces)
    #print sr[0].attrib

    # note l_uleg, r_uleg have an extra <geometry> called label-lib 
    geometries = root.findall("./x:library_geometries/x:geometry",namespaces)
    print '----------------------------',
    for geom in geometries:
        print "["+geom.attrib['id']+"]",
    print '\n'



    geo = root.find("./x:library_geometries/x:geometry",namespaces)

    geo_name =  geo.attrib['id']
    geo_name = geo_name[:-4] #remove '-lib'
    print geo_name

    # find the internal homogeneous transformation matrix

    #TT3 = root.findall("./x:library_visual_scenes/x:visual_scene/x:node/x:node/x:node[@name='"+geo_name +"']/x:matrix",namespaces)
    #print TT3
    #T = [float(t) for t in TT3[0].text.strip().split(' ') ] 
    #print T

    #Rin = matrix([[T[0],T[1],T[2]],[T[4],T[5],T[6]],[T[8],T[9],T[10]]])  # rotation, intrinsic
    #pin = matrix([T[3],T[7],T[11]]).T # translation, intrinsic

    et_string = "./x:library_visual_scenes/x:visual_scene" 

    lname = ntpath.basename(dae_file_name)[0:-4]

    suffix =  ["/x:node[@name='g27']", "/x:node[@name='"+ lname +"']", "/x:node[@name='"+ geo_name +"']", "/x:node/x:node[@name='"+ geo_name +"']" ]
    # for V3 model only
    suffix[1] = "/x:node[@name='"+lname+"_node']"

    RR = []
    pp = []
    for i in range(len(suffix)):
        TT = root.findall(et_string+ suffix[i] + "/x:matrix",namespaces)
        
        if TT != []: 
            print root.findall(et_string+ suffix[i], namespaces)[0].attrib['name']         
            et_string = et_string+ suffix[i]
        
            T = [float(t) for t in TT[0].text.strip().split(' ') ] 
            #print T
            r1=norm([T[0],T[1],T[2]])
            r2=norm([T[4],T[5],T[6]])
            r3=norm([T[4],T[5],T[6]])
            if r1==r2 and r2==r3:
                print 'scaling consistent', r1
            #Rin = matrix([ [T[0]/r1,T[1]/r1,T[2]/r1] , [T[4]/r2,T[5]/r2,T[6]/r2] , [T[8]/r3,T[9]/r3,T[10]/r3] ])  # rotation, intermediate
            Rin = matrix([ [T[0],T[1],T[2]] , [T[4],T[5],T[6]] , [T[8],T[9],T[10]] ])  # rotation, intermediate, with scaling
            pin = matrix([T[3],T[7],T[11]]).T # translation, intermediate
            
            RR.append(Rin)
            pp.append(pin)

	#print RR
	#print pp

    source = geo.find("./x:mesh//x:source[@id='"+geo_name+"-POSITION'"+"]",namespaces)
    verteces = [float(s) for s in source.find("./x:float_array",namespaces).text.strip().split( )]
    vert_cnt = int(source.find("./x:float_array",namespaces).attrib['count'])/3
    print vert_cnt


#    triangle1 = geo.find("./x:mesh/x:triangles",namespaces)
#    prim1 = triangle1.find("./x:p",namespaces)
#    inputs1 = triangle1.findall("./x:input",namespaces)
#    m = len(inputs1)
#    vertex_indeces = [int(p) for p in prim1.text.strip().split(' ') if p.isdigit()] #The method isdigit() checks whether the string consists of digits only.
#    print len(vertex_indeces)
#    print m
#    vertex_indeces = vertex_indeces[0::m]
#    face_cnt = len(vertex_indeces)/3
#    print face_cnt
    
    triangles_list = geo.findall("./x:mesh/x:triangles",namespaces)
    vertex_indeces = []
    face_cnt = 0
    for triangles in triangles_list:
        p = triangles.find("./x:p",namespaces)
        inputs = triangles.findall("./x:input",namespaces)
        m = len(inputs)
        print m
        ptmp = [int(i) for i in p.text.strip().split(' ') if i.isdigit()]
        vertex_indeces = vertex_indeces + ptmp[0::m]
        face_cnt = face_cnt+len(ptmp[0::m])/3
    print face_cnt
        


    #print verteces
    #print vertex_indeces

    # individual treatment
    arranged_label_idx = []
    arranged_label_verts = []
    label_face_cnt = 0
    label_vert_cnt = 0
    if lname=='l_uleg' or lname=='r_uleg':
        labelgeo = root.find("./x:library_geometries/x:geometry[@id='label-lib']",namespaces)
        v3_string = "./x:library_visual_scenes/x:visual_scene/x:node[@name='g27']/x:node[@name='"+ lname +"_node']/x:node[@name='label']/x:matrix" 
        TL = root.find(v3_string,namespaces)
        T = [float(t) for t in TL.text.strip().split(' ') ] 
        Rl = matrix([ [T[0],T[1],T[2]] , [T[4],T[5],T[6]] , [T[8],T[9],T[10]] ])
        pl = matrix([T[3],T[7],T[11]]).T
   
        ls = labelgeo.find("./x:mesh//x:source[@id='label-POSITION'"+"]",namespaces)
        label_verteces = [float(s) for s in ls.find("./x:float_array",namespaces).text.strip().split( )]
        label_vert_cnt = int(ls.find("./x:float_array",namespaces).attrib['count'])/3
        print 'label_vert_cnt', label_vert_cnt

        label_triangles = labelgeo.find("./x:mesh/x:triangles",namespaces)

        p = label_triangles.find("./x:p",namespaces)
        inputs = label_triangles.findall("./x:input",namespaces)
        m = len(inputs)
        label_vertex_indeces = [int(i) for i in p.text.strip().split(' ') if i.isdigit()]
        label_vertex_indeces = label_vertex_indeces[0::m]
        label_vertex_indeces = [ lvi+vert_cnt for lvi in label_vertex_indeces  ]
        label_face_cnt = len(label_vertex_indeces)/3

        arranged_label_verts = [list(y) for y in zip(*[label_verteces[i::3] for i in range(3)])  ]
        arranged_label_verts = [ list( array  ( RR[0]*(RR[1]*(Rl*matrix(alv).T + pl)+pp[1])+pp[0]  ).reshape(-1) ) for alv in arranged_label_verts]
        arranged_label_idx =   [list(y) for y in zip( *[label_vertex_indeces[i::3] for i in range(3)]) ]
        arranged_label_verts =  [list(array(R*matrix(alv).T + matrix(pos_offset).T ).reshape(-1)) for alv in arranged_label_verts]



    # write extracted data to xan file

    fxan = open(xan_file_name, 'w')
    n=3
    arranged_verts = [list(y) for y in zip(*[verteces[i::n] for i in range(n)])  ] # 'star' to unpack list
    #arranged_verts = [ list(array(RR*matrix(av).T + pp).reshape(-1))  for av in arranged_verts ]
    
    # quick workaround
    if len(RR) == 3:
        arranged_verts = [ list( array  ( RR[0]*(RR[1]*(RR[2]*matrix(av).T + pp[2])+pp[1])+pp[0]  ).reshape(-1) ) for av in arranged_verts]
    else:
        arranged_verts = [ list( array  ( RR[0]*(RR[1]*matrix(av).T +pp[1])+pp[0]  ).reshape(-1) ) for av in arranged_verts]

    arranged_idx =   [list(y) for y in zip( *[vertex_indeces[i::n] for i in range(n)]) ]

    linkname = ntpath.basename(dae_file_name)[0:-4]
    #if linkname == 'l_clav':
    #    for i in arranged_verts:
    #        print i

    #print arranged_verts[0]

##        for i in arranged_verts:
##            print i
##        print '-------------'
        #change vertex coord.
    arranged_verts =  [list(array(R*matrix(v).T + matrix(pos_offset).T ).reshape(-1)) for v in arranged_verts]
    #arranged_verts =  [list(array(R*matrix(v).T ).reshape(-1)) for v in arranged_verts]

	#print arranged_verts[0]

##        for i in arranged_verts:
##            print i


    if lname=='l_uleg' or lname=='r_uleg':
        vert_cnt = vert_cnt + label_vert_cnt
        face_cnt = face_cnt + label_face_cnt
        arranged_verts = arranged_verts + arranged_label_verts
        arranged_idx = arranged_idx + arranged_label_idx
        pass


        
    light_str = '''    0.000000    0.000000    0.000000
    0.588235    0.588235    0.588235
    0.588235    0.588235    0.588235
    0.588235    0.588235    0.588235
    0.300000
    1.000000
    1.000000    1.000000    1.000000
        '''

    print>>fxan, light_str

    print>>fxan, vert_cnt, face_cnt

    print>>fxan, ''

    for item in arranged_verts:
        print>>fxan, '{0:11f} {1:11f} {2:11f}'.format(item[0], item[1], item[2])

    print>>fxan, ''

    print>>fxan,  face_cnt*' 3'

    print>>fxan, ''

    for item in arranged_idx:
        print>>fxan, '{0:8d} {1:8d} {2:8d}'.format(item[2],item[1], item[0]) # note the sequence!
    fxan.close()

            
if __name__ == '__main__':
    dae_file_name = 'mtorso.dae'
    xan_file_name = 'mtorso.xan'
    R=matrix([[0,0,1],[1,0,0],[0,1,0]])
    #R=matrix(eye(3))
    p=[0,0,0]
    translate2xan(dae_file_name, xan_file_name,R, p)
