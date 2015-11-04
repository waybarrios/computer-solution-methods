clear all
clc
 
%% Variables
syms  x X
f=-2484/(10*x^4+27);
 
%% Puntos seleccionados
xi=[-4 -3 -2 -1 0 1 2 3 4];
fxi=subs(f,x,xi);
 
%% Ajuste Newton
n1=length(xi);
n2=length(xi);
b(1)=fxi(1);
for j=1:n1-1
    clear F
    for i=1:n2-1
        F(i)=(fxi(i+1)-fxi(i))/(xi(i+j)-xi(i));
    end
    b(j+1)=F(1);
    fxi=F;
    n2=length(F) ;
end
X(1)=1;
for i=2:n1
    X(i)=X(i-1)*(x-xi(i-1));
end
F=sum(b.*X);
pretty(F)
 
%% Graficas
X=-4:0.1:4;
fxi=subs(f,x,xi);
fX=subs(f,x,X);
FX=subs(F,x,X);
 
hold on
plot(xi,fxi,'* blue','LineWidth',5)
plot(X,fX,'red','LineWidth',2)
plot(X,FX,'black','LineWidth',2)
grid on
title('Interpolación de Newton')
xlabel('x')
ylabel('y')
legend('Puntos Seleccionados','Funcion Original','Funcion con el ajuste de Newton')
ylim([-100 50]) 
