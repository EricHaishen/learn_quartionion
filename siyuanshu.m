%%
%浣滅敤锛?姹傚洓鍏冩暟鏃嬭浆鐭╅樀  
%璇存槑锛?鎵?湁鍥涘厓鏁伴兘涓哄崟浣嶅洓鍏冩暟

%定义： 四元数的四个分量 q = a + b*i + c*j + d*k
 syms a b c d ; %用于计算确定每个单轴的旋转矩阵

%定义本体动态坐标初始状态 , v0 = x0*i + y0*j + z0*k
% global x0;
% global y0;
% global z0;
% x0 = 1;
% y0 = 1;
% z0 = 1;
% fprintf('定义初始状态对应的纯四元数为：\n')
% fprintf('\t v0 = x0*i + y0*j + z0*k \n')
% fprintf('该状态对应的矩阵为：\n')
% v0 =[x0    0      0;
%      0     y0     0;
%      0     0      z0]

%%
% %求每个轴向旋转对应的四元数旋转矩阵形式，求解后需注释对应段
% % Cz 表示 绕Z轴 cos(theta)   Sz 表示 绕Z轴 sin(theta) 
% %定义绕z轴旋转的角度和轴
 syms Cz Sz ;
% a=Cz;

%瀹氫箟锛?鍥涘厓鏁扮殑鍥涗釜鍒嗛噺 q = a + b*i + c*j + d*k
% syms a b c d ; %鐢ㄤ簬璁＄畻纭畾姣忎釜鍗曡酱鐨勬棆杞煩闃?

%瀹氫箟鏈綋鍔ㄦ?鍧愭爣鍒濆鐘舵? , v0 = x0*i + y0*j + z0*k
global x0;
global y0;
global z0;
x0 = 1;
y0 = 1;
z0 = 1;
fprintf('瀹氫箟鍒濆鐘舵?瀵瑰簲鐨勭函鍥涘厓鏁颁负锛歕n')
fprintf('\t v0 = x0*i + y0*j + z0*k \n')
fprintf('璇ョ姸鎬佸搴旂殑鐭╅樀涓猴細\n')
v0 =[x0    0      0;
     0     y0     0;
     0     0      z0]

%%
% %姹傛瘡涓酱鍚戞棆杞搴旂殑鍥涘厓鏁版棆杞煩闃靛舰寮忥紝姹傝В鍚庨渶娉ㄩ噴瀵瑰簲娈?
% %瀹氫箟缁晍杞存棆杞殑瑙掑害鍜岃酱
 syms cos_rz sin_rz ;
% a=cos_rz;
% b=0;
% c=0;
% d=Sz;


% %定义绕y轴旋转的角度和轴
 syms Cy Sy;
% a=Cy;

% %瀹氫箟缁晊杞存棆杞殑瑙掑害鍜岃酱
 syms cos_ry sin_ry;
% a=cos_ry;
% b=0;
% c=-Sy;
% d=0;

% %定义绕x轴旋转的角度和轴
syms Cx Sx;
% a=Cx;
% b=1*Sx;

% %瀹氫箟缁晉杞存棆杞殑瑙掑害鍜岃酱
syms cos_rx sin_rx;
% a=cos_rx;
% b=1*sin_rx;
% c=0;
% d=0;

%瀹氫箟q1_L,q1_R鍒嗗埆涓哄搴斿洓鍏冩暟宸︿箻鍙充箻鐨勫乏涔樼煩闃靛舰寮?
% q_1= [a -b -c -d;    
%       b a -d c;
%       c d a -b;
%       d -c b a ];
%   
% q_2= [a  -b  -c  -d;
%       b  a    d  -c;
%       c  -d   a   b;
%       d  c   -b   a];
% %鍙杚_2鐨勮浆缃紝涓轰粈涔堝彇鍛紝寰呰В閲?
% q2 = [a b c d;
%     -b a -d c;
%     -c d a -b;
%     -d -c b a];
% q = q_1*q2

%%
%初始化旋转角度
global theta_z;
global theta_y;
global theta_x;
global oper_z;
global oper_y;
global oper_x;
%设定角度的乘积算子
oper_z = 1/3; 
oper_y = 1/3;
oper_x = 0;
%得到相对应的 theta/2
theta_z = pi*oper_z;
theta_y = pi*oper_y;
theta_x = pi*oper_x;

%三角函数运算赋值
% Cz = cos(theta_z);
% Sz = sin(theta_z);
% Cy = cos(theta_y);
% Sy = sin(theta_y);
% Cx = cos(theta_x);
% Sx = sin(theta_x);


%定义进行旋转的旋转矩阵    化为3*3的矩阵
%对所有的2倍角公式进行整理，要注意的一个地方就是:
%   Cz^2-Sz^2=cos(2*theta_z) 这里使用Cz直接表示cos(2*theta_z)
%   2*Sz*Cz=sin(2*theta_z) 这里使用Sz直接表示sin(2*theta_z)

%绕z轴旋转
%  q_z = [Cz^2 - Sz^2,    -2*Cz*Sz,                     0;
%         2*Cz*Sz,        Cz^2 - Sz^2,                  0;
%         0                                   0,                        1];
 Q_Z= [Cz -Sz 0;
       Sz  Cz 0;
       0   0  1];
    

% 绕y轴旋转
%  q_y = [Cy^2 - Sy^2,                     0,      2*Cy*Sy;
%                             0, Cy^2 + Sy^2,                    0;
%            -2*Cy*Sy,                     0,  Cy^2 - Sy^2];
Q_Y = [Cy , 0 ,Sy;
       0 , 1 ,0;
       -Sy , 0, Cy];
 

%绕x轴旋转
%  q_x = [  1,           0,           0;
%           0, Cx^2 - Sx^2,    -2*Cx*Sx;
%           0,     2*Cx*Sx, Cx^2 - Sx^2];

Q_X = [1,0,0;
       0, Cx,-Sx;
       0, Sx,Cx];
%绕本体惯性参考系三个轴向复合旋转后的矩阵，旋转顺序为 x -> y -> z
%因为四元数第一个代表的是cos(theta/2),如果给theta，由于四元数本身的双倍覆盖
%给theta会使得实际旋转角为  2*theta
% global oper_rad2deg %弧度值转角度值
% oper_rad2deg = 360 /(2*pi);
% fprintf('绕z轴旋转角度：%d 度\n',2*oper_z*oper_rad2deg)   
% fprintf('绕y轴旋转角度：%d 度\n',2*oper_y*oper_rad2deg)
% fprintf('绕x轴旋转角度：%d 度\n',2*oper_x*oper_rad2deg)

fprintf('四元数复合旋转矩阵为：')
%rotate = q_z * q_y *q_x

%与欧拉角相对应的旋转矩阵
Rotate = Q_Z * Q_Y * Q_X
% %旋转后的状态
% fprintf('旋转后得到的矩阵为：\n')
% v_after_rotate = rotate * v0

%%
%%控制部分  待写
%四元数差值计算

%PID控制

%更新四元数

%控制量输出





%?  化为3*3矩阵
%z轴
 q_z = [cos_rz^2 - sin_rz^2,    -2*cos_rz*sin_rz,                     0;
        2*cos_rz*sin_rz,        cos_rz^2 - sin_rz^2,                  0;
        0                                   0,                        1];

%y轴?
 q_y = [cos_ry^2 - sin_ry^2,                     0,      2*cos_ry*sin_ry;
                            0, cos_ry^2 + sin_ry^2,                    0;
           -2*cos_ry*sin_ry,                     0,  cos_ry^2 - sin_ry^2];

%x轴
 q_x = [  1,                     0,                 0;
          0, cos_rx^2 - sin_rx^2,    -2*cos_rx*sin_rx;
          0,     2*cos_rx*sin_rx, cos_rx^2 - sin_rx^2];

%双倍覆盖? 2*theta
fprintf('绕x轴旋转%d\n',2*theta_x)
fprintf('绕y轴旋转%d\n',2*theta_y)
fprintf('绕z轴旋转%d\n',2*theta_z)

fprintf('旋转矩阵为：')
rotate = q_z * q_y *q_x
?
fprintf('旋转后的矩阵为:')
v_after_rotate = rotate * v0 


