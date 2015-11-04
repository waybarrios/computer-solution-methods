%Metodo de Biseccion - Metodos Numericos Matlab
clc;
Fx=input('Ingrese la funcion: ','s');
a=input('Ingrese a : ');
c=input('Ingrese c : ');
e=input('Ingrese el error : ');
 
x=a;
 
x=c;
Fc=eval(Fx);
fprintf('\n %6s %7s %8s %10s %8s %8s %8s \n ','A','B','C','F(a)','F(b)','F(c)','|c-a|');
while abs(c-a)>e
    b=(a+c)/2;
    x=b;
    Fb=eval(Fx);
    
    fprintf('\n %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f \n',a,b,c,Fa,Fb,Fc,abs(c-a));
    if Fa*Fb<=0
        c=b;
        Fc=Fb;
    else
        a=b;
        Fa=Fb;
    end
 
end
fprintf('\nEl resultado sera %.4f\n',b);
ezplot(Fx);%graficamos la funcion
grid on;
