clear;
clc;
L1=Link([pi/4,0,0,0,0],'modified');
L2=Link([pi/2,0.2,0.1,0,0],'modified');
L3=Link([0,0.1,0.2,0,0],'modified');
robot=SerialLink([L1,L2,L3]);%用定义好的关节建立机器人
robot.display();%显示建立的机器人DH参数
theta=[0 0 0];%6个关节的角度变量值都设为0，可以更改
robot.plot(theta);%显示机器人的图像
