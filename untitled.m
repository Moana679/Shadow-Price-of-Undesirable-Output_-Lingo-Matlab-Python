% calculate shadow price with random numbers
x11=0.5*x1.*x1
x12=x1.*x2
x21=0.5*x2.*x1
x22=0.5*x2.*x2
y2=0.5*y.*y
b2=0.5*b.*b
x1b=x1.*b
x2b=x2.*b
yb=y.*b
x1y=x1.*y
x2y=x2.*y

m4=y+b
m5=0.5*x1.*x1
m6=0.5*x2.*x2
m7=x1.*x2
m8=0.5*y.*y+0.5*b.*b+y.*b
m9=x1.*y+x1.*b
m10=x2.*y+x2.*b

v1=ones(104,1) % 1 column vector
v0=zeros(104,1) % 0 column vector
 
A0=[v1 x1 x2 m4 m5 m6 m7 m8 m9 m10 cit year]
AX1=[v0 v1 v0 v0 x1 v0 x2 v0 y+b v0 v0 v0]
AX2=[v0 v0 v1 v0 v0 x2 x1 v0 v0 y+b v0 v0]
AB=[v0 v0 v0 v1 v0 v0 v0 b+y x1 x2 v0 v0]
AY=[v0 v0 v0 v1 v0 v0 v0 y+b x1 x2 v0 v0]

A=[A0;AX1;AX2;AB;AY]

ans=rank(A)

T=rref(A)

D=[rand(104,1)*50-b;rand(104,1)*50;rand(104,1)*50;rand(104,1)*50-1;-1*rand(104,1)*50]

p=D\A


