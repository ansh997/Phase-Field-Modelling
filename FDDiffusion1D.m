clear all;
clear all;
clc;
clf;
dt = 0.001;
dx = 1.0;
D = 1.0;
kappa = 1.0;
A = 1.0;
beta = D*dt/(dx*dx);
%beta2 = 2*kappa*dt/(dx*dx*dx*dx);

n = 32;
N = 40000;
clf;
hold on

m = 1.0;

for i = 1:n
  oldc(i) = 0.5*(1+sin(2*pi*m*i*dx/n));
  newc(i) = 0.0;
endfor

plot(oldc);

hold on


for j = 1:N
  for i = 1:n
    w = i-1;  https://onlinecourses.nptel.ac.in/noc18_mm17/unit?unit=10&lesson=12
    e = i+1;
    
    if (w==0) w=w+n;
    endif
    if (e==n+1) e = e-n;
    endif
    newc(i) = oldc(i) + beta*(oldc(w) + oldc(e) -2*oldc(i));
  endfor
  
  for i = 1:n
    oldc(i) = newc(i);
  endfor
  
endfor

plot (oldc, 'r');


