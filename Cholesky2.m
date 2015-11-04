function [L] = Cholesky2(A)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n=size(A);
matriz=zeros(n);


matriz(1,1)=A(1,1).^(1/2);

for i=2:n
    for j=1:i
        if i==j 
        matriz(i,i)=Lii(A(i,i),i,matriz);
        else
        matriz(i,j)=Lij(A(i,j),i,j,matriz);    
        end
   
    end
end
L=matriz;
end
