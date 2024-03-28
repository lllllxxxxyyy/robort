%关节空间轨迹规划
clear;
clc;
ML1=Link([0,0.4967,0,0,0],'modified');
ML2=Link([-pi/2,-0.18804,0.2,3*pi/2,0],'modified');
ML3=Link([0,0.17248,0.79876,0,0],'modified');
ML4=Link([0,0.98557,0.25126,3*pi/2,0],'modified');
ML5=Link([0,0,0,pi/2,0],'modified');
ML6=Link([0,0,0,pi/2,0],'modified');
robot=SerialLink([ML1 ML2 ML3 ML4 ML5 ML6],'name','Fanuc M29ia');

%给定末端执行器的初始位置
p1=[
    0.617222144 0.465154659 -0.634561241 -0.254420286
    -0.727874557 0.031367208 -0.684992502 -1.182407321
    -0.298723039 0.884673523 0.357934776 -0.488241553
    0 0 0 1
];
%给定末端执行器的终止位置
p2=[
    -0.504697849 -0.863267623 -0.007006569 0.664185871
    -0.599843651 0.356504321 -0.716304589 -0.35718173
    0.620860432 -0.357314539 -0.697752567 2.106929688
    0 0 0 1
];
%利用运动学反解ikine求解各关节转角
init_ang=robot.ikine(p1);
targ_ang=robot.ikine(p2);

%利用五次多项式计算关节速度和加速度
step=40;
[q,qd,qdd]=jtraj(init_ang,targ_ang,step);

%显示机器人姿态随时间的变化
subplot(3,3,[1,4,7]);
robot.plot(q);

%显示机器人关节运动状态
subplot(3,3,2);
i=1:6;
plot(q(:,i));
title('初始位置 各关节角度随时间的变化 目标位置');
grid on;
subplot(3,3,5);
i=1:6;
plot(qd(:,i));
title('各关节角速度随时间的变化');
grid on;
subplot(3,3,8);
i=1:6;
plot(qdd(:,i));
title('各关节角加速度随时间的变化');
grid on;
subplot(3,3,3);
hold on
grid on
title('末端执行器在三维空间中的位置变化');
for i=1:step
    position=robot.fkine(q(i,:));
    plot3(position.t(1),position.t(2),position.t(3),'b.','MarkerSize',5);
end

%末端执行器的线速度和角速度
subplot(3,3,6);
hold on
grid on
title('末端执行器速度大小随时间的变化');
vel=zeros(step,6);
vel_velocity=zeros(step,1);
vel_angular_velocity=zeros(step,1);
for i=1:step
    vel(i,:)=robot.jacob0(q(i,:))*qd(i,:)';
    vel_velocity(i)=sqrt(vel(i,1)^2+vel(i,2)^2+vel(i,3)^2);
    vel_angular_velocity(i)=sqrt(vel(i,4)^2+vel(i,5)^2+vel(i,3)^6);
end
x=linspace(1,step,step);
plot(x,vel_velocity);
subplot(3,3,9);
hold on
grid on
title('末端执行器角速度大小随时间的变化');
x=linspace(1,step,step);
plot(x,vel_angular_velocity);

