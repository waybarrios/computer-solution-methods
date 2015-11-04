function [M] = Aumento(A)
n=length(A);
s=200; %Tamaño de interes
g=s/n
M=repmat(A,g,g)
