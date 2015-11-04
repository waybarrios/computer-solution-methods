function [ lij ] = Lij( aij, i, j, L)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
suma=0;

for k=1:j-1
    suma= suma+ (L(i,k).* L(j,k));
end

lij= (aij-suma)./L(j,j);

end
