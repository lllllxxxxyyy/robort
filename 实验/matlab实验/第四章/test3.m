L1=Link('d',0,'a',0,'alpha',pi/2);
L2=Link('d',0,'a',0.5,'alpha',0,'offset',pi/2);
L3=Link('d',0,'a',0,'alpha',pi/2,'offset',pi/4);
L4=Link('d',1,'a',0,'alpha',-pi/2);
L5=Link('d',0,'a',0,'alpha',pi/2);
L6=Link('d',1,'a',0,'alpha',0);
robot=SerialLink([L1,L2,L3,L4,L5,L6]);%用定义好的关节建立机器人
robot.display();%显示建立的机器人DH参数
theta=[0 0 0 0 0 0];%6个关节的角度变量值都设为0，可以更改
robot.plot(theta);%显示机器人的图像