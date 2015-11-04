%% splines grado 1
clear all
clc
 
%% Variables
syms xi x
Fxi=-2484/(10*xi^4+27);
 
%% Puntos seleccionados
t=[-4;-2.5;-1.8;-0.8;-0.5;0.2;1.8;2.6;3;4];
f=subs(Fxi,xi,t);
T=-4:0.1:4;
k=length(t);
n=k-1;% Intervalos
ne=2*n; %Numero de ecuaciones
 
%% Formacion de la matriz A y del vector B
B=zeros(ne,1);
for i=1:n-1
    A(2*i-1,2*i-1:2*i-1+1)=[t(i+1) 1]; 
    A(2*i,2*i+1:2*i+1+1)=[t(i+1) 1];
    fxi=f(i+1);
    B(2*i-1)=fxi;
    B(2*i)=fxi;   
end
A(2*n-1,1:2)=[t(1) 1];
A(2*n,ne-1:ne)=[t(k) 1];
B(2*n-1)=f(1);
B((2*n-1)+1)=f(k);
 
%% Funciones de ajuste
S=A\B;
for i=1:n
    ab(i,1:2)=S(2*i-1:2*i);
    X(i,1:2)=[x 1];
end
F=ab.*X;
for i=1:n
   g(i,1)=sum(F(i,:));
end
F=g
 
%% Graficas
ft=subs(Fxi,xi,t);
fT=subs(Fxi,xi,T);
figure(1)
hold on
plot(t,ft,'* blue','LineWidth',5)
plot(T,fT,'red','LineWidth',2')
for i=1:n
    Ti=t(i):0.1:t(i+1);
    Tij=Ti;
    nTij=length(Tij);
    for j=1:nTij
        FT(j)=sum(subs(F(i,:),x,Tij(j)));
    end
    plot(Tij,FT,'black','LineWidth',2)
    clear FT;
    clear Ti;
end
grid on
title('Polinomios de grado 1')
xlabel('x')
ylabel('y')
legend('Puntos Seleccionados','Funcion Original','Funcion con el ajuste de Newton')
ylim([-100 50])
 
 
