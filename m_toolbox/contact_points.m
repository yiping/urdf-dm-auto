clear all
clc
load feet_mesh

temp = max(r_foot_mesh);
xmax= temp(1);
ymax= temp(2);
zmax= temp(3);
temp = min(r_foot_mesh);
xmin= temp(1);
ymin= temp(2);
zmin= temp(3);
    

r_contacts = [xmax, ymax, zmax;
              xmax, ymax, zmin;
              xmax, ymin, zmin;
              xmax, ymin, zmax];
          
          
temp = max(l_foot_mesh);
xmax= temp(1);
ymax= temp(2);
zmax= temp(3);
temp = min(l_foot_mesh);
xmin= temp(1);
ymin= temp(2);
zmin= temp(3);
    

l_contacts = [xmax, ymax, zmax;
              xmax, ymax, zmin;
              xmax, ymin, zmin;
              xmax, ymin, zmax];
      
disp('right')
for i=1:4
    s =sprintf('%10.6f %10.6f %10.6f', r_contacts(i,1), r_contacts(i,2), r_contacts(i,3));  
    disp(s)    
end


disp('left')
for i=1:4
    s =sprintf('%10.6f %10.6f %10.6f', l_contacts(i,1), l_contacts(i,2), l_contacts(i,3));  
    disp(s)    
end
