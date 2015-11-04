function [M] = Fibo(n)

serie(1)=0;
serie(2)=1;

for i=3:n
    serie(i)=serie(i-2)+serie(i-1);
end

serie

end

