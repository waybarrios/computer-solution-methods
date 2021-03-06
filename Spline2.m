%% splines grado 2
clear all
 
%% Variables
syms xi x
Fxi=-2484/(10*xi^4+27);
 
%% Puntos seleccionados
t=[-4;-2.5;-1.8;-0.8;-0.5;0.2;1.8;2.6;3;4];
f=subs(Fxi,xi,t);
T=-4:0.1:4;
k=length(t);
n=k-1;
ne=3*n-1;
 
%% Formacion de la matriz A y del vector B
A(1,1:2)=[t(2),1];
A(2,3:5)=[t(2)^2,t(2),1];
A(2*(n-1)+3,1:4)=[1 0 -2*t(2) -1];
B=zeros(ne,1);
for i=2:n-1
    A(2*i-1,3*(i-1):3*(i-1)+2)=[t(i+1)^2 t(i+1) 1];
    A(2*i  ,3*i    :3*i    +2)=[t(i+1)^2 t(i+1) 1]; 
    A(2*(n-2)+4+i,3*(i-1):3*(i-1)+4)=[2*t(i+1) 1 0 -2*t(i+1) -1];
end
A((2*n-1),1:2)=[t(1) 1];
A(((2*n-1)+1),ne-2:ne)=[t(k)^2 t(k) 1];   
for i=1:n-1
    fxi=f(i+1);
    B(2*i-1)=fxi;
    B(2*i)=fxi;
end
B(2*n-1)=f(1);
B((2*n-1)+1)=f(k);
 
%% Funciones de ajuste
S(2:ne+1,1)=A\B; 
for i=1:n
    abc(i,1:3)=S(3*i-2:3*i-2+2);
    X(i,1:3)=[x^2 x 1];
end
F=abc.*X;
for i=1:n
   g(i,1)=sum(F(i,:));
end
F=g
