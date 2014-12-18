clear all
name = 'l_glut';
mass=0.866;
cg = [0.0133341 0.0170484 -0.0312052]';
ixx=0.000691326; ixy=-2.24344e-05; ixz=2.50508e-06; iyy=0.00126856; iyz=0.000137862; izz=0.00106487;
Icmbar = [ixx ixy ixz;
          ixy iyy iyz;
          ixz iyz izz];
R = [0 1 0; 0 0 1; 1 0 0];

Icom = [Icmbar zeros(3); zeros(3) mass*eye(3)];

Ibar = Icmbar + mass*cr3(cg)*cr3(cg)'
I_link = [Ibar, mass*cr3(cg); mass*cr3(cg)', mass*eye(3)]

% this is wrong
%I_link_new = [R*Icmbar*R' + mass*R*cr3(R*cg)*cr3(R*cg)'*R', mass*R*cr3(R*cg)*R'; R*mass*cr3(R*cg)'*R', mass*R*eye(3)*R']

I_link_new2 = [R*Icmbar*R' + mass*R*cr3(cg)*cr3(cg)'*R', mass*R*cr3(cg)*R'; R*mass*cr3(cg)'*R', mass*R*eye(3)*R']
I_link_new3 = [R*Icmbar*R' + mass*cr3(R*cg)*cr3(R*cg)', mass*cr3(R*cg); mass*cr3(R*cg)', mass*eye(3)]

eig(Icom)
eig(I_link)
%eig(I_link_new)
eig(I_link_new2)
eig(I_link_new3)

Idm =[
 0.00226600   0.00059900  -0.00021900   0.00000000  -0.01154724  -0.02702353  
 0.00059900   0.00147100   0.00036300   0.01154724   0.00000000  -0.01476357  
-0.00021900   0.00036300   0.00178600   0.02702353   0.01476357   0.00000000  
 0.00000000   0.01154724   0.02702353   0.86600000   0.00000000   0.00000000  
-0.01154724   0.00000000   0.01476357   0.00000000   0.86600000   0.00000000  
-0.02702353  -0.01476357   0.00000000   0.00000000   0.00000000   0.86600000]