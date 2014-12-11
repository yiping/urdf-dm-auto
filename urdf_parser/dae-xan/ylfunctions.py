import xml.etree.ElementTree as ET

from scipy import *
from scipy.linalg import *

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

    geos = root.findall("./x:library_geometries/x:geometry",namespaces)

    for geo in geos:
        geo_name =  geo.attrib['id']
        geo_name = geo_name[:-4] #remove '-lib'
        #print geo_name
        source = geo.find("./x:mesh//x:source[@id='"+geo_name+"-POSITION'"+"]",namespaces)
        verteces = [float(s) for s in source.find("./x:float_array",namespaces).text.strip().split( )]
        vert_cnt = int(source.find("./x:float_array",namespaces).attrib['count'])/3
        #print vert_cnt
        prim = geo.find("./x:mesh/x:triangles/x:p",namespaces)
        vertex_indeces = [int(p) for p in prim.text.strip().split(' ') if p.isdigit()] #The method isdigit() checks whether the string consists of digits only.
        vertex_indeces = vertex_indeces[0::3]
        face_cnt = len(vertex_indeces)/3
        #print verteces
        #print vertex_indeces

        # write extracted data to xan file

        fxan = open(xan_file_name, 'w')
        n=3
        arranged_verts = [list(y) for y in zip(*[verteces[i::n] for i in range(n)])  ] # 'start' to unpack list
        arranged_idx =   [list(y) for y in zip( *[vertex_indeces[i::n] for i in range(n)]) ]

##        for i in arranged_verts:
##            print i
##        print '-------------'
        #change vertex coord.
        arranged_verts =  [list(array(R*matrix(v).T + matrix(pos_offset).T ).reshape(-1)) for v in arranged_verts]

##        for i in arranged_verts:
##            print i
        
        light_str = '''    0.000000    0.000000    0.000000
    0.700000    0.700000    0.700000
    0.700000    0.700000    0.700000
    0.800000    0.800000    0.830000
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
            print>>fxan, '{0:8d} {1:8d} {2:8d}'.format(item[0], item[1], item[2])
        fxan.close()

            
if __name__ == '__main__':
    dae_file_name = 'mtorso.dae'
    xan_file_name = 'mtorso.xan'
    R=matrix([[0,0,1],[1,0,0],[0,1,0]])
    #R=matrix(eye(3))
    p=[0,0,0]
    translate2xan(dae_file_name, xan_file_name,R, p)
