function [M] = Aumento(A)
n=length(A);
s=200; %Tama�o de interes
g=s/n
M=repmat(A,g,g)
