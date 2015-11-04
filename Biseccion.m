%Programa que halla la raiz aproximada para una ecuacion no lineal
%mediante el metodo de Biseccion
fun=input('Digite la funcion con X mayucula:', 's');
a=input('Introduzca el limite inferior del intervalo: ');
b=input('Introduzca el limite superior del intervalo: ');
tolab=input('Introduzca la tolerancia para [a,b]: ');
tolfc=input('Introduzca la tolerancia para f(c): ');
fa=str2num(strrep(fun,'X',num2str(a)));
fb=str2num(strrep(fun,'X',num2str(b)));
if(sign(fa)~=sign(fb))
sw=0;
while(sw==0)
c=(a+b)/2;
fc=str2num(strrep(fun,'X',num2str(c)));
if(abs(b-a)<=tolab||abs(fc)<=tolfc)
sw=1;
else
if(sign(fa)~=sign(fc))
b=c;fb=fc;
else
a=c;fa=fc;
end
end
end
fprintf('La raiz es:%f\n',c);
fprintf('Con valor de:%f\n',fc);
else
disp('No hay raiz en el intervalo suministrado')
end
