grafico

clc;
x=linspace(1,50,1000);
plot(x,exp(-x)+cos(x),'r');hold on;
plot(10,exp(-10)+cos(10),'o');hold on;
plot(x,pt(x,10,2));
