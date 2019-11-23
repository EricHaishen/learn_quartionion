%验证四元数左乘与右乘矩阵是否满足结合律 m1=t * t1 * t2 与m2=t * (t1 * t2)等价

%定义三个矩阵的变量
syms a b c d float 
syms a1 b1 c1 d1 float
syms a2 b2 c2 d2 float

a=1.0
b=1.0
c=1
d=1

%构造矩阵
disp('构造三个矩阵')
t=[a b ;c d ]
t1=[a1 b1  ;c1 d1 ]
t2=[a2 b2 ; c2 d2 ]

%矩阵相乘
m1=(t * t1) * t2;
m2=t * (t1 * t2);
%不满足交换律，如果t1右乘 t2 可以看做 t1左乘t2的变形，那么就可以
m3=(t * t2) * t1;
m4=t * (t2 * t1);

%去除相乘后存在的括号,便于观察结果
expand(m1)
expand(m2)
expand(m3)
expand(m4)

