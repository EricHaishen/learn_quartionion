%%
%作用： 求四元数旋转矩阵  
%说明： 所有四元数都为单位四元数

<<<<<<< HEAD
%���壺 ��Ԫ�����ĸ����� q = a + b*i + c*j + d*k
 syms a b c d ; %���ڼ���ȷ��ÿ���������ת����

%���屾�嶯̬�����ʼ״̬ , v0 = x0*i + y0*j + z0*k
% global x0;
% global y0;
% global z0;
% x0 = 1;
% y0 = 1;
% z0 = 1;
% fprintf('�����ʼ״̬��Ӧ�Ĵ���Ԫ��Ϊ��\n')
% fprintf('\t v0 = x0*i + y0*j + z0*k \n')
% fprintf('��״̬��Ӧ�ľ���Ϊ��\n')
% v0 =[x0    0      0;
%      0     y0     0;
%      0     0      z0]

%%
% %��ÿ��������ת��Ӧ����Ԫ����ת������ʽ��������ע�Ͷ�Ӧ��
% % Cz ��ʾ ��Z�� cos(theta)   Sz ��ʾ ��Z�� sin(theta) 
% %������z����ת�ĽǶȺ���
 syms Cz Sz ;
% a=Cz;
=======
%定义： 四元数的四个分量 q = a + b*i + c*j + d*k
% syms a b c d ; %用于计算确定每个单轴的旋转矩阵

%定义本体动态坐标初始状态 , v0 = x0*i + y0*j + z0*k
global x0;
global y0;
global z0;
x0 = 1;
y0 = 1;
z0 = 1;
fprintf('定义初始状态对应的纯四元数为：\n')
fprintf('\t v0 = x0*i + y0*j + z0*k \n')
fprintf('该状态对应的矩阵为：\n')
v0 =[x0    0      0;
     0     y0     0;
     0     0      z0]

%%
% %求每个轴向旋转对应的四元数旋转矩阵形式，求解后需注释对应段
% %定义绕z轴旋转的角度和轴
 syms cos_rz sin_rz ;
% a=cos_rz;
>>>>>>> 4a61336b380e37151bc4d5507b9195a4f98125cd
% b=0;
% c=0;
% d=Sz;

<<<<<<< HEAD
% %������y����ת�ĽǶȺ���
 syms Cy Sy;
% a=Cy;
=======
% %定义绕y轴旋转的角度和轴
 syms cos_ry sin_ry;
% a=cos_ry;
>>>>>>> 4a61336b380e37151bc4d5507b9195a4f98125cd
% b=0;
% c=-Sy;
% d=0;

<<<<<<< HEAD
% %������x����ת�ĽǶȺ���
syms Cx Sx;
% a=Cx;
% b=1*Sx;
=======
% %定义绕x轴旋转的角度和轴
syms cos_rx sin_rx;
% a=cos_rx;
% b=1*sin_rx;
>>>>>>> 4a61336b380e37151bc4d5507b9195a4f98125cd
% c=0;
% d=0;

%定义q1_L,q1_R分别为对应四元数左乘右乘的左乘矩阵形式
% q_1= [a -b -c -d;    
%       b a -d c;
%       c d a -b;
%       d -c b a ];
%   
% q_2= [a  -b  -c  -d;
%       b  a    d  -c;
%       c  -d   a   b;
%       d  c   -b   a];
% %取q_2的转置，为什么取呢，待解释
% q2 = [a b c d;
%     -b a -d c;
%     -c d a -b;
%     -d -c b a];
% q = q_1*q2

%%
%初始化三个轴旋转的角度
global theta_z;
global theta_y;
global theta_x;
global oper_z;
global oper_y;
global oper_x;
%�趨�Ƕȵĳ˻�����
oper_z = 1/3; 
oper_y = 1/3;
oper_x = 0;
%�õ����Ӧ�� theta/2
theta_z = pi*oper_z;
theta_y = pi*oper_y;
theta_x = pi*oper_x;

%���Ǻ������㸳ֵ
% Cz = cos(theta_z);
% Sz = sin(theta_z);
% Cy = cos(theta_y);
% Sy = sin(theta_y);
% Cx = cos(theta_x);
% Sx = sin(theta_x);

<<<<<<< HEAD
%���������ת����ת����    ��Ϊ3*3�ľ���
%�����е�2���ǹ�ʽ����������Ҫע���һ���ط�����:
%   Cz^2-Sz^2=cos(2*theta_z) ����ʹ��Czֱ�ӱ�ʾcos(2*theta_z)
%   2*Sz*Cz=sin(2*theta_z) ����ʹ��Szֱ�ӱ�ʾsin(2*theta_z)

%��z����ת
%  q_z = [Cz^2 - Sz^2,    -2*Cz*Sz,                     0;
%         2*Cz*Sz,        Cz^2 - Sz^2,                  0;
%         0                                   0,                        1];
 Q_Z= [Cz -Sz 0;
       Sz  Cz 0;
       0   0  1];
    

% ��y����ת
%  q_y = [Cy^2 - Sy^2,                     0,      2*Cy*Sy;
%                             0, Cy^2 + Sy^2,                    0;
%            -2*Cy*Sy,                     0,  Cy^2 - Sy^2];
Q_Y = [Cy , 0 ,Sy;
       0 , 1 ,0;
       -Sy , 0, Cy];
 

%��x����ת
%  q_x = [  1,           0,           0;
%           0, Cx^2 - Sx^2,    -2*Cx*Sx;
%           0,     2*Cx*Sx, Cx^2 - Sx^2];

Q_X = [1,0,0;
       0, Cx,-Sx;
       0, Sx,Cx];
%�Ʊ�����Բο�ϵ�������򸴺���ת��ľ�����ת˳��Ϊ x -> y -> z
%��Ϊ��Ԫ����һ����������cos(theta/2),�����theta��������Ԫ��������˫������
%��theta��ʹ��ʵ����ת��Ϊ  2*theta
% global oper_rad2deg %����ֵת�Ƕ�ֵ
% oper_rad2deg = 360 /(2*pi);
% fprintf('��z����ת�Ƕȣ�%d ��\n',2*oper_z*oper_rad2deg)   
% fprintf('��y����ת�Ƕȣ�%d ��\n',2*oper_y*oper_rad2deg)
% fprintf('��x����ת�Ƕȣ�%d ��\n',2*oper_x*oper_rad2deg)

fprintf('��Ԫ��������ת����Ϊ��')
%rotate = q_z * q_y *q_x

%��ŷ�������Ӧ����ת����
Rotate = Q_Z * Q_Y * Q_X
% %��ת���״̬
% fprintf('��ת��õ��ľ���Ϊ��\n')
% v_after_rotate = rotate * v0

%%
%%���Ʋ���  ��д
%��Ԫ����ֵ����

%PID����

%������Ԫ��

%���������





=======
%定义进行旋转的旋转矩阵    化为3*3的矩阵
%z轴旋转
 q_z = [cos_rz^2 - sin_rz^2,    -2*cos_rz*sin_rz,                     0;
        2*cos_rz*sin_rz,        cos_rz^2 - sin_rz^2,                  0;
        0                                   0,                        1];

%绕y轴旋转
 q_y = [cos_ry^2 - sin_ry^2,                     0,      2*cos_ry*sin_ry;
                            0, cos_ry^2 + sin_ry^2,                    0;
           -2*cos_ry*sin_ry,                     0,  cos_ry^2 - sin_ry^2];

%z轴旋转
 q_x = [  1,                     0,                 0;
          0, cos_rx^2 - sin_rx^2,    -2*cos_rx*sin_rx;
          0,     2*cos_rx*sin_rx, cos_rx^2 - sin_rx^2];
      
%绕本体惯性参考系三个轴向复合旋转后的矩阵，旋转顺序为 z -> y -> x
%因为四元数第一个代表的是cos(theta/2),如果给theta，由于四元数本身的双倍覆盖
%给theta会使得实际旋转角为  2*theta
fprintf('绕z轴旋转角度：%d\n',2*theta_z)
fprintf('绕y轴旋转角度：%d\n',2*theta_y)
fprintf('绕x轴旋转角度：%d\n',2*theta_x)

fprintf('旋转矩阵为：')
rotate = q_z * q_y *q_x
%旋转后的状态
fprintf('旋转后得到的矩阵为：\n')
v_after_rotate = rotate * v0 
>>>>>>> 4a61336b380e37151bc4d5507b9195a4f98125cd

