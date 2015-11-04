
syms x 
f= 1/exp(x)+cos(x);
for i=0:5
    d=diff(f);
    f=d
end
