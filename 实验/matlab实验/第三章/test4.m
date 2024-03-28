p1=[1,5,4,1]';
R1=trotz(90*pi/180);
R2=trotx(90*pi/180);
T1=transl(0,0,3);
T2=transl(0,5,0);
p2=R1*R2*T1*T2*p1;
disp(p2);