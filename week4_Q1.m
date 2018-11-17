clear all;
clf;
clc;

x = linspace(-1, 1, 100);

fun = x.*sin(x).*cosh(x.^2);
plot(x,fun)