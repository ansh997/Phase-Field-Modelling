clear all;
clf;
clc;

x = linspace(-1, 1, 100);

fun = (1.-5.*x).*exp(x);
plot(x,fun)