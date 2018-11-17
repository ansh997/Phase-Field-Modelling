clear all;
clf;
clc;

x = linspace(0.001, 1, 100);
for alpha = 2:5

DG = alpha*x.*(1.-x) .+ x.*log(x) .+ (1.-x).*log(1.-x);

plot(x, DG);
hold on 
endfor