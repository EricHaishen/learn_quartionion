%ѡ����������ϵ  ��ת˳���� �� x->y->z
%%
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
%��������
 syms Cz Sz;
 syms Cy Sy;
 syms Cx Sx;
 
%%
 %��ʼ����������ת�ĽǶ�
% global theta_z;
% global theta_y;
% global theta_x;
% global oper_z;
% global oper_y;
% global oper_x;
% %�趨�Ƕȵĳ˻�����
% oper_z = 0; 
% oper_y = 0;
% oper_x = 0;
% %�õ����Ӧ�� theta/2
% theta_z = pi*oper_z;
% theta_y = pi*oper_y;
% theta_x = pi*oper_x;

%���Ǻ������㸳ֵ
% Cz = cos(theta_z);
% Sz = sin(theta_z);
% Cy = cos(theta_y);
% Sy = sin(theta_y);
% Cx = cos(theta_x);
% Sx = sin(theta_x);
 

%%
 % %������z����ʱ����תΪ������
r_z = [Cz  -Sz  0;
       Sz   Cz  0;
       0        0    1];

% %������y��˳ʱ����תΪ������ 
r_y = [Cy  0    Sy;
          0    1     0   ;
      -Sy  0    Cy];
% %������x����ʱ����תΪ������
r_x = [  1       0      0;
         0   Cx  -Sx;
         0   Sx   Cx];
     
% global oper_rad2deg %����ֵת�Ƕ�ֵ
% oper_rad2deg = 360 /(2*pi);
% fprintf('��z����ת�Ƕȣ�%d ��\n',oper_z*oper_rad2deg)   
% fprintf('��y����ת�Ƕȣ�%d ��\n',oper_y*oper_rad2deg)
% fprintf('��x����ת�Ƕȣ�%d ��\n',oper_x*oper_rad2deg)    

fprintf('ŷ���Ǹ�����ת����Ϊ��')
rotate = r_z * r_y *r_x
%rotate2 = r_x * r_y *r_z
% %��ת���״̬
% fprintf('��ת��õ��ľ���Ϊ��\n')
% v_after_rotate = rotate * v0
 