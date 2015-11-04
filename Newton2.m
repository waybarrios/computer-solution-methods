clear all
clc
 
%% Grafica
I=-5:0.1:5;
[x y]=meshgrid(I);
f=x.^2+x.*y.^3-9;
g=3*(x.^2).*y-y.^3-4;
 
hold on
contour(x,y,f,[-1,-1],'black','LineWidth',2)
contour(x,y,g,[-1,-1],'red','LineWidth',2)
grid on
 
title('Soluciones para z=-1')
xlabel('x')
ylabel('y')
zlabel('z')
 
%% Solucion
clear all
clc
 
% Variables y funciones
syms x y
f=x^2+x*y^3-8;
g=3*x^2*y-y^3-3;
 
% Metodo de Newton Multivariables
F=[f;g];
xy=[x;y];
DTj=det(jacobian(F,xy));
xi=[1;1];
e=1;
tol=0.000001;
while e>tol
    DTj=subs(DTj,xy,xi);
    Fxi=subs(F,xy,xi);
    s=xi-Fxi/DTj;
    e=abs(s-xi);
    xi=s;
    plot3(s(1),s(2),-1,'+','LineWidth',2)
end
legend('f=x^2+xy^3-9','g=3x^2y-y^3-4','Recorrido dela solucion')

s 
