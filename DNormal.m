function [ normal ] = DNormal(a,b)   
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
f='(1/sqrt(2*pi))*exp((-x^2)/2)';
h=1;t=1;
for i=a:0.1:b
    t=1;
    for j=a:0.01:0.09
        z(h,t)=Trapecios(f,a,i+j,10);
        t=t+1;
    end
    h=h+1;
end
normal=z+0.5;
end 
