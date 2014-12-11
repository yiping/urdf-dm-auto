import numpy as np
from scipy import *
from scipy.linalg import *
from math import cos, sin

def mcross(x):
    M = matrix([ [0.0, -x[2], x[1]],
                   [x[2], 0.0, -x[0]],
                   [-x[1], x[0], 0.0]])
    return M

def rpy2Rot(r,p,y):
    cy = cos(y)
    cp = cos(p)
    cr = cos(r)
    sp = sin(p)
    sy = sin(y)
    sr = sin(r)
    
    Rot = matrix([ [cy*cp, cy*sp*sr-sy*cr, cy*sp*cr+sy*sr],
                     [sy*cp, sy*sp*sr+cy*cr, sy*sp*cr-cy*sr],
                     [-sp, cp*sr, cp*cr]])
    #print type(Rot)
    return Rot

def axisAngle2Rot(v, theta):
    nv = norm(v)
    v = v/nv
    Rot = matrix(expm(theta*mcross(v)))
    #print type(Rot)
    return Rot

def Icmbar2Ibar(m, Icmbar, c_g):
    mc = mcross(c_g)
    Ibar = Icmbar + m* mc* (mc.T)
    #print type(Ibar)
    return Ibar

def rotCongruenceTx(R, I):
    return R.T * I * R

##def mdhAutoRotate(clink):
##    if clink.mdh_zaxis == None:
##        print 'insufficient information'
##        exit()
##
##    if clink.mdh_zaxis == [0,0,1]:
##        return matrix(eye(3))
##    else:
##        z = [0,0,1]
##        v = cross(z, clink.mdh_zaxis)
##        v = v/norm(v)
##        theta = arccos(dot(z, clink.mdh_zaxis))/norm(v)
##        R = axisAngle2Rot(v, theta)
##        return R.T

def MDH_massage(parent, child):
    t1 = parent.mdh_rotation* matrix(child.pos_rel_plink).T
    child.pos_rel_plink = list(array(t1).reshape(-1))
    pos = child.pos_rel_plink # in parent ref frame

    t2 = parent.mdh_rotation* matrix(child.mdh_zaxis).T
    child.mdh_zaxis = list(array(t2).reshape(-1))
    # rule-based conversion
    #print pos, child.mdh_zaxis

    # rule 1
    if abs(pos[0])<1e-10 and abs(pos[2])<1e-10 and child.mdh_zaxis == [0, 0, 1]:
        print child.name, "invokes rule 1"
        child.mdh_zscrew_params = [0.0, pi/2]
        child.mdh_params = [pos[1], 0.0, 0.0, 0.0]
        child.mdh_rotation = ( matrix(parent.mdh_rotation).T * matrix(expm( pi/2*mcross([0, 0, 1]) ))  ).T
    
    # rule 2
    elif abs(pos[0])<1e-10 and abs(pos[1])<1e-10 and abs(pos[2])<1e-10 and child.mdh_zaxis == [0,-1, 0]:
        print child.name, "invokes rule 2"
        child.mdh_zscrew_params = [0.0, 0.0]
        child.mdh_params = [0.0, pi/2, 0.0, 0.0]
        child.mdh_rotation = ( matrix(parent.mdh_rotation).T * matrix(expm( pi/2*mcross([1.0, 0, 0]) ))  ).T

    # rule 3
    elif abs(pos[1])<1e-10 and abs(pos[2])<1e-10 and child.mdh_zaxis == [0, 0, 1]:
        print child.name, "invokes rule 3"
        child.mdh_zscrew_params = [0.0, 0.0]
        child.mdh_params = [pos[0], 0.0, 0.0, 0.0]
        child.mdh_rotation = matrix(parent.mdh_rotation)

    # rule 4
    elif abs(pos[0])<1e-10 and abs(pos[1])<1e-10 and child.mdh_zaxis == [0,1,0]:
        print child.name, "invokes rule 4"
        child.mdh_zscrew_params = [pos[2], 0.0]
        child.mdh_params = [0.0, -pi/2.0, 0.0, 0.0]
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T * matrix(expm( -pi/2*mcross([1.0, 0, 0]) ))  ).T

    # rule 5 (similar to rule 6)
    elif abs(pos[0])<1e-10 and abs(pos[1])>1e-10 and abs(pos[2])<1e-10 and child.mdh_zaxis == [1,0,0]:
        print child.name, "invokes rule 5"
        child.mdh_zscrew_params = [0.0, -pi/2]
        child.mdh_params = [pos[0], -pi/2.0, 0.0, 0.0]
        zsRot = matrix(expm( -pi/2*mcross([ 0, 0, 1]) ))
        Rot = matrix(expm( -pi/2*mcross([1,0, 0]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T * zsRot * Rot).T

    # rule 6
    elif abs(pos[0])>1e-10 and abs(pos[1])>1e-10 and abs(pos[2])>1e-10 and  child.mdh_zaxis == [1,0,0]:
        print child.name, "invokes rule 6"
        child.mdh_zscrew_params = [pos[2], -pi/2]
        child.mdh_params = [-pos[1], -pi/2.0, pos[0], 0.0]
        zsRot = matrix(expm( -pi/2*mcross([ 0, 0, 1]) ))
        Rot = matrix(expm( -pi/2*mcross([1,0, 0]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T *zsRot  *Rot  ).T

    # rule 7
    elif abs(pos[0])>1e-10 and abs(pos[1])>1e-10 and abs(pos[2])<1e-10 and child.mdh_zaxis == [0,0, 1]:
        print child.name, "invokes rule 7"
        print "(Aw, snap! this is parallel z axis with non-zero x,y offsets) non-orthogonal Zero Configuartion"
        child.mdh_zscrew_params = [ 0.0, arctan(pos[1]/pos[0]) ]
        child.mdh_params = [ sqrt(pos[0]*pos[0]+pos[1]*pos[1]), 0.0, 0.0, -arctan(pos[1]/pos[0]) ]
        zsRot = matrix(expm( arctan(pos[1]/pos[0])*mcross([ 0, 0, 1]) ))
        Rot = matrix(expm( -arctan(pos[1]/pos[0])*mcross([0, 0, 1]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T *zsRot  *Rot  ).T

    # rule 8
    elif abs(pos[0])>1e-10 and abs(pos[1])<1e-10  and abs(pos[2])>1e-10 and child.mdh_zaxis == [0,-1, 0]:
        print child.name, "invokes rule 8", child.mdh_zaxis
        child.mdh_zscrew_params = [ pos[2], 0 ]
        child.mdh_params = [ pos[0], pi/2.0, 0.0,0.0 ]
        zsRot = matrix(eye(3))
        Rot = matrix(expm( pi/2*mcross([1,0, 0]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T *zsRot  *Rot  ).T

    # rule 9
    elif abs(pos[0])>1e-10 and abs(pos[1])<1e-10 and abs(pos[2])<1e-10 and child.mdh_zaxis == [0, -1, 0]:
        print child.name, "invokes rule 9, [easy case]"
        child.mdh_zscrew_params = [ 0.0, 0.0 ]
        child.mdh_params = [ pos[0], 0.0, 0.0,0.0 ]
        zsRot = matrix(eye(3))
        Rot = matrix(eye(3))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T *zsRot  *Rot  ).T

    # rule 10
    elif abs(pos[0])<1e-10 and abs(pos[1])<1e-10 and abs(pos[2])<1e-10 and [int(i) for i in child.mdh_zaxis] == [0,-1, 0]:
        print child.name, "invokes rule 10 [similar to rule 8]"
        child.mdh_zscrew_params = [ 0.0, 0.0 ]
        child.mdh_params = [ 0.0, pi/2.0, 0.0,0.0 ]
        zsRot = matrix(eye(3))
        Rot = matrix(expm( pi/2*mcross([1,0, 0]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T *zsRot  *Rot  ).T

    # rule 11
    elif abs(pos[0])>1e-10 and abs(pos[1])>1e-10 and abs(pos[2])<1e-10 and child.mdh_zaxis == [1,0,0]:
        print child.name, "invokes rule 11"
        child.mdh_zscrew_params = [0.0, pi/2]
        child.mdh_params = [pos[1], pi/2.0, pos[0], 0.0]
        zsRot = matrix(expm( pi/2*mcross([ 0, 0, 1]) ))
        Rot = matrix(expm( pi/2*mcross([1,0, 0]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T * zsRot * Rot).T

    # rule 12
    elif abs(pos[0])>1e-10 and abs(pos[1])<1e-10  and abs(pos[2])>1e-10 and child.mdh_zaxis == [0,1, 0]:
        print child.name, "invokes rule 12"
        child.mdh_zscrew_params = [ pos[2], 0 ]
        child.mdh_params = [ pos[0], -pi/2.0, 0.0,0.0 ]
        zsRot = matrix(eye(3))
        Rot = matrix(expm( -pi/2*mcross([1,0, 0]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T *zsRot  *Rot  ).T

    # rule 13
    elif abs(pos[0])>1e-10 and abs(pos[1])>1e-10  and abs(pos[2])<1e-10 and child.mdh_zaxis == [0,-1, 0]:
        print child.name, "invokes rule 13"
        child.mdh_zscrew_params = [ 0, 0 ]
        child.mdh_params = [ pos[0], pi/2.0, -pos[1],0.0 ]
        zsRot = matrix(eye(3))
        Rot = matrix(expm( pi/2*mcross([1,0, 0]) ))
        child.mdh_rotation = (   matrix(parent.mdh_rotation).T *zsRot  *Rot  ).T
    
    else:
        print child.name, ": unexpected situation", child.mdh_zaxis

    # update inertia properties in the new frame
    ##if child.name != 'head':
    
    child.inertia = rotCongruenceTx( child.mdh_rotation, child.inertia)
    t3 = child.mdh_rotation* matrix(child.cg).T
    child.cg = list(array(t3).reshape(-1))

    return



if __name__ == "__main__":
    a = array([1,2,3])  # np.array([1,2,3])
    #print mcross(a)

    #print rpy2Rot(1.570784, 0, 0)

    b = [0, 0, 1]
    R = axisAngle2Rot(b, 1.570784)
    print R

    Icmbar = matrix([[1.0/12.0, 0.0, 0.0],[0.0, 0.0, 0.0],[0.0,0.0,1.0/12.0]])
    cg = [0.5, 0.0, 0.0]
    print Icmbar2Ibar(1.0, Icmbar, cg)

    I_ = rotCongruenceTx(R.T, Icmbar)
    print I_

    


    c = matrix('1.0;2.0;3.0')
    print mcross(c)

    
