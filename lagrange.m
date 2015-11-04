clear all
clc
 
%% Variables
syms x
f=-2484/(10*x^4+27);
 
%% Puntos seleccionados
xi=[-4 -3 -2 -1 0 1 2 3 4];
fxi=subs(f,x,xi);
 
%% Ajuste Lagrange
n=length(xi);
for i=1:n
    x1(i)=(x-xi(i));    
end
 
for i=1:n
    x2(i)=prod(x1)/(x-xi(i));    
    for j=1:i-1    
        x3(j)=(xi(i)-xi(j));          
    end
    for j=i+1:n
        x3(j-1)=(xi(i)-xi(j));          
    end    
    x4(i)=prod(x3);   
end
F=sum(x2.*fxi./x4);
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
title('Interpolación de Lagrange')
xlabel('x')
ylabel('y')
legend('Puntos Seleccionados','Funcion Original','Funcion con el ajuste de Newton')
ylim([-100 50])

