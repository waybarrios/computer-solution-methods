clc
clear all
close all
t=0:0.000001:0.03;
x=5-5*exp(-370*t).*(t>=0).*(t<=0.013545)
xt=5*exp(-370*(t-0.013545)).*(t>=0.013545)+0;
xfin=x+xt;
plot(t,xt)