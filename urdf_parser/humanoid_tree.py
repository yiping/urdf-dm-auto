class Link:
        
    def __init__(self, name):
        # initializes the data members
        self.name = name
        self.tree_level = None
        self.parent = None 
        self.children = []
        self.children_cnt = 0
        self.mass = 0
        self.inertia = None # in link ref frame
        self.cg = None      # in link ref frame
        self.mesh_name = None
        self.visual_offset = None

        self.mdh_zaxis = None
        self.mdh_rotation = None
        self.mdh_zscrew_params = None
        self.mdh_params = None

        #transform from the parent link to the child link 
        self.pos_rel_plink = None # in parent link ref frame
        self.rpy_rel_plink = None # relative to parent link ref frame

        self.dm_string = None


class HumanoidTree:
    def __init__(self, root):
        # initializes the root member
        self.root = root


    def printTree(self,root):
        if root == [] or root == None:
            pass
        else:
            print '[',root.name, '] level:', root.tree_level
            print 'children count:', root.children_cnt
            print 'mass:', root.mass
            print 'inertia:\n', root.inertia
            print 'cg:', root.cg
            print 'mesh:', root.mesh_name
            print 'visual offset', root.visual_offset
            print 'pos rel parent:', root.pos_rel_plink
            print 'rpy rel parent:', root.rpy_rel_plink
            print 'mdh z:', root.mdh_zaxis
            print 'mdh rotation:\n', root.mdh_rotation
            print 'MDH ZScrew:', root.mdh_zscrew_params
            print 'MDH params:', root.mdh_params
            print
            
            for c in root.children:
                self.printTree(c)

    def getDepth(self, root):
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
                d.append( self.getDepth(root.children[i]) )
            
            depth = max(d)
            #print depth
            return (depth+1)
        else:
            return 0
        
            
