
function [ lii ] = Lii( aii, i, L)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
suma=0;

for j=1:i-1;
    suma=suma+L(i,j).^2;
end

lii=(aii-suma).^(1/2);
end