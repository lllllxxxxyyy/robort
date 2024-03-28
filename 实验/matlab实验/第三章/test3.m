p1=[7,3,1,1]';
R1=trotz(90*pi/180);
T=transl(4,-3,7);
R2=troty(90*pi/180);
p2=R2*T*R1*p1;
disp(p2);