urdf-dm-auto
============

This project parses urdf description of a robot and automatically converts it to the .dm format which can then be used by DynaMechs. But this is just a general 'long-term' goal, for now, 'robot' means DRC ATLAS model.

Interesting project! But the implementation is far from perfection. To save development time, many problems are dealt with ad-hoc solutions and may not be generally applicable.

I use ATLAS V3 URDF and meshes as the blue print. I initially tried V4, but there seems to be some problems with l_clav and r_clav links (the urdf and the graphics do not match). Maybe OSRF is still workin on V4?

# Known issues:
- The atlas.dm generated in windows does not work immediately with DynaMechs. The problem seems to be caused by '\r\n' in windows and '\n' in linux. Need to improve fix DynaMechs' dm loader program where there is time
- When interpreting COLLADA dae format:
```sh
<library_visual_scenes>
    <visual_scene>
        <node>
        ...
            <node>
                ...
            <node>
```
It has been noticed that most link dae file has 4 layers of nodes, some has 4, and some only has 2. Each layer contains a rotation and an offset. My extraction script only works with the specific atlas model.
- For Atlas V3 model, most link dae files only have 1 geometry, but l_uleg and r_uleg have two geometry (the second one is for thigh label). I don't have a general script to iterate all the geometries, but just some special treatment for these two links.
- The translation from urdf description to Modified D-H convention are based on empirical rules (I didn't aim for an exhaustive rule-base (there shouldn't be too many anyway) but just create one when I need to, and some rules may be redundant and some can be generalized). It turns out to be working pretty well, and can add z_screws as needed. But please pay attention to the two special cases:

## The child z-axis is parallel to the parent z-axis, and the x,y offset (in parent frame) are non-zero 
example: l_uleg and l_lleg

## The child z-axis is not orthogonal to any of parent's axis, and the child is not at the tip
example: utoro and l_clav, there involves an additional rotation. 


# About URDF notation
##<mass> 
mass value
##<origin> 
Link center of mass. The xyz offset is defined in the link local reference frame
Attributes:
- xyz (required) | Position offset of the center of mass of the link with respect to the link origin in the link local reference frame
- rpy (required) | Roll, pitch and yaw orientation offsets of the inertial frame in local link frame. All angles are always in radians.
##<inertia>
Moment of inertia
Attributes:
- ixx, iyy, izz, ixy, iyz, ixz (required) | Components of the inertia matrix for the link. The inertia parameters are specified with respect to the center of the mass in local link coordinate system.
