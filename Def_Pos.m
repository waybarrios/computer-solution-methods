function [M] = Aumento(A)
n=length(A);
s=100; %Tama�o de interes
g=s/n
M=repmat(A,25,25)
