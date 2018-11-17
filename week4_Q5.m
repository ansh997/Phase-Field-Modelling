clf;
clc;
n = linspace(0, 10, 10);

h = 6.26e-34;
m = 9.1e-31;
L = 3e-10;

En = h^2/(2*m)*n./(2*L);

plot(n, En)