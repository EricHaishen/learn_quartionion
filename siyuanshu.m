%求四元数旋转矩阵
%定义四元数的四个分量 q = a + b*i + c*j + d*k
syms a b c d ;

%求每个轴向旋转对应的四元数旋转矩阵形式，求解后需注释对应段
%定义绕z轴旋转的角度和轴
% syms cos(rz);
% a=cos(rz);
% b=0;
% c=0;
% d=1;

% %定义绕y轴旋转的角度和轴
% syms cos(ry);
% a=cos(ry);
% b=0;
% c=1;
% d=0;

% %定义绕x轴旋转的角度和轴
% syms cos(rx);
% a=cos(rx);
% b=1;
% c=0;
% d=0;

%定义q1_L,q1_R分别为对应四元数左乘右乘的左乘矩阵形式
% q_1= [a -b -c -d;    
%       b a -d c;
%       c d a -b;
%       d -c b a ]
%   
% q_2= [a  -b  -c  -d;
%       b  a    d  -c;
%       c  -d   a   b;
%       d  c   -b   a]
% %定义进行旋转的旋转矩阵
% q = q_1 * q_2
% q_y = q_L*q_R
% q_x = q_L*q_R

%绕本体惯性参考系三个轴向复合旋转后的矩阵
%rotate


 syms e f g h
 q1= [a b c d ]
 q2= [e;f;g;h]
% q_L=q1*q2
 q_R=q2*q1


