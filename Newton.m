clear all
clc
 
%% Senos y Cosenos
c2=(2^0.5)/2;
c1=4/(17^0.5);
s2=(2^0.5)/2;
s1=(17^0.5)/17;
 
%% Valores
T=1500;
C=-800;
P1=0;
P2=1000;
P=(P1+P2)/2;
e=1;
tol=0.000001;
 
%% Matriz de coeficientes y vector de valores    
A=sparse([c2 c1 0 0 0 1 0 0;s2  s1 0 0 0 0 1 0;-c2 0 c2 0 0 0 0 0;-s2 0 -s2 -1 0 0 0 0;0 0 -c2 0 -c1 0 0 0;0 0 s2 0 s1 0 0 1;0 -c1 0 0 c1 0 0 0;0 -s1 0 1 -s1 0 0 0]);
B=sparse([0;0;-P;0;0;0;0;P]);
n=length(B);
 
%% Eslabon critico
 AB=[A,B];   
for i=1:n-1   
    for j=i+1:n    
        if abs(AB(j,i))>abs(AB(i,i))       
            pivote=AB(i,:);            
            AB(i,:)=AB(j,:);            
            AB(j,:)=pivote;                         
        end        
        aij=AB(j,i)/AB(i,i);        
        AB(j,i:n+1)=AB(j,i:n+1)-aij*AB(i,i:n+1);       
    end   
end
x(n,1)=AB(n,n+1)/AB(n,n);
for i=n-1:-1:1
    x(i,1)=(AB(i,n+1)-AB(i,i+1:n)*x(i+1:n))/AB(i,i);    
end
[Tmax iT]=max(x);
[Cmax iC]=min(x);
 
if Tmax>abs(Cmax)
    Fmax=T;%Carga con la que fallara la armadura    
    Ec=iT;    
else    
    Fmax=C;%Carga con la que fallara la armadura    
    Ec=iC;    
end
Eslabon_critico=Ec
 
%% Biseccion
k=0;
while e>tol
    k=k+1;
    A=sparse([c2 c1 0 0 0 1 0 0;s2  s1 0 0 0 0 1 0;-c2 0 c2 0 0 0 0 0;-s2 0 -s2 -1 0 0 0 0;0 0 -c2 0 -c1 0 0 0;0 0 s2 0 s1 0 0 1;0 -c1 0 0 c1 0 0 0;0 -s1 0 1 -s1 0 0 0]);
    B=sparse([0;0;-P;0;0;0;0;P]);
    n=length(B);
    AB=[A,B];    
    for i=1:n-1   
        for j=i+1:n
            if abs(AB(j,i))>abs(AB(i,i))
                pivote=AB(i,:);
                AB(i,:)=AB(j,:);
                AB(j,:)=pivote;              
            end
            aij=AB(j,i)/AB(i,i);
            AB(j,i:n+1)=AB(j,i:n+1)-aij*AB(i,i:n+1);
        end
    end
    x(n,1)=AB(n,n+1)/AB(n,n);
    for i=n-1:-1:1
        x(i,1)=(AB(i,n+1)-AB(i,i+1:n)*x(i+1:n))/AB(i,i);
    end
    if abs(x(Ec))>abs(Fmax)
        P2=P;
    else
        P1=P;
    end
    Pmax=P;
    P=(P1+P2)/2;
    e=abs(Pmax-P);
    PMAX(k,1)=P;
end
PMAX
Pmax
x
