function [ y ] = pt( x,x0,n )
suma=0;
for i=1:n
 
fi=(-1)^i*exp(-x0)+((-1)^floor((i+1)/2))*(sin(x0)+cos(x0)+((-1)^i)*(cos(x0)-sin(x0)))/2;
suma=suma+fi.*(x-x0).^i/factorial(i);
end
y=suma;
end
