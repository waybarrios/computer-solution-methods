clear all
n=input('Digite el tama?o de la matriz ');
for i=1:n
for j=1:n
fprintf('Digite la componente entera %i ',i);
fprintf('%i\n',j);
a(i,j)=input('a(i,j)=');
end
end
for i=1:n
fprintf ('Digite la componente entera %i ',i);
b(i)=input('b(i)= ');
end
b=b';
for k=1:n-1
for i=k+1:n
z=a(i,k)/a(k,k);
a(i,k)=0;
for j=k+1:n
a(i,j)=a(i,j)-(z*a(k,j));
end
b(i)=b(i)-(z*b(k));
end
end
for i=n:-1:1
su=0;
for j=i+1:n
su=su+a(i,j)*x(j);
end
x(i)=(b(i)-su)/a(i,i);
end
disp(x)
