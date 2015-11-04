function tc=trapecio(f,a,b,n)
f=inline(f);
h=(b-a)/n;
tc=f(a)+f(b);
for i=1:n-1
x=a+i*h;
tc=tc+2*f(x);
end 
tc=(h/2)*tc;
%f=inline('cos(x)/x','x');
%f(pi());
