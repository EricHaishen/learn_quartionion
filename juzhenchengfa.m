%��֤��Ԫ��������ҳ˾����Ƿ��������� m1=t * t1 * t2 ��m2=t * (t1 * t2)�ȼ�

%������������ı���
syms a b c d float 
syms a1 b1 c1 d1 float
syms a2 b2 c2 d2 float

a=1.0
b=1.0
c=1
d=1

%�������
disp('������������')
t=[a b ;c d ]
t1=[a1 b1  ;c1 d1 ]
t2=[a2 b2 ; c2 d2 ]

%�������
m1=(t * t1) * t2;
m2=t * (t1 * t2);
%�����㽻���ɣ����t1�ҳ� t2 ���Կ��� t1���t2�ı��Σ���ô�Ϳ���
m3=(t * t2) * t1;
m4=t * (t2 * t1);

%ȥ����˺���ڵ�����,���ڹ۲���
expand(m1)
expand(m2)
expand(m3)
expand(m4)

