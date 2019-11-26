%选择右手坐标系  旋转顺序是 ： x->y->z
%%
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
%声明变量
 syms Cz Sz;
 syms Cy Sy;
 syms Cx Sx;
 
%%
 %初始化三个轴旋转的角度
% global theta_z;
% global theta_y;
% global theta_x;
% global oper_z;
% global oper_y;
% global oper_x;
% %设定角度的乘积算子
% oper_z = 0; 
% oper_y = 0;
% oper_x = 0;
% %得到相对应的 theta/2
% theta_z = pi*oper_z;
% theta_y = pi*oper_y;
% theta_x = pi*oper_x;

%三角函数运算赋值
% Cz = cos(theta_z);
% Sz = sin(theta_z);
% Cy = cos(theta_y);
% Sy = sin(theta_y);
% Cx = cos(theta_x);
% Sx = sin(theta_x);
 

%%
 % %定义绕z轴逆时针旋转为正方向，
r_z = [Cz  -Sz  0;
       Sz   Cz  0;
       0        0    1];

% %定义绕y轴顺时针旋转为正方向， 
r_y = [Cy  0    Sy;
          0    1     0   ;
      -Sy  0    Cy];
% %定义绕x轴逆时针旋转为正方向，
r_x = [  1       0      0;
         0   Cx  -Sx;
         0   Sx   Cx];
     
% global oper_rad2deg %弧度值转角度值
% oper_rad2deg = 360 /(2*pi);
% fprintf('绕z轴旋转角度：%d 度\n',oper_z*oper_rad2deg)   
% fprintf('绕y轴旋转角度：%d 度\n',oper_y*oper_rad2deg)
% fprintf('绕x轴旋转角度：%d 度\n',oper_x*oper_rad2deg)    

fprintf('欧拉角复合旋转矩阵为：')
rotate = r_z * r_y *r_x
%rotate2 = r_x * r_y *r_z
% %旋转后的状态
% fprintf('旋转后得到的矩阵为：\n')
% v_after_rotate = rotate * v0
 