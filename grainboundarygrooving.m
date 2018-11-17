clear all;
clc;
clf;
more off

function y = Xi(e1,e2)
  y = 0.25*e1*e1*e1*e1-0.5*e1*e1+0.25*e2*e2*e2*e2-0.5*e2*e2+2*e1*e1*e2*e2+0.25;
endfunction

function y = Xip(e1,e2)
  y = e1*e1*e1-e1+4*e1*e2*e2;
endfunction
kappac=1;
kappaphi1=1/3;
kappaphi2=1/3;
A=1.0;
B=1.0;
Z=1.0;
N=64;
dx=1.0;
c=zeros(N,N);
phi1=zeros(N,N);
phi2=zeros(N,N);
for i = 1:N
  for j = 1:N
    if (j<N/4 || j>(3*N)/4)
      c(i,j) = 1.0;
      if (i<N/2)
        phi1(i,j) = 1.0;
        phi2(i,j) = 1.0;
      endif
    endif
  endfor
endfor

mesh(c)
view(2)
pause(0)
halfN = N/2
delk = 2*pi/N
dt = 0.5;

for n = 1:50
  for m =1:2
    for j = 1:N
      for k = 1:N
        gca(j,k) = 2*A*c(j,k)*(1-c(j,k)) + 2*B*c(j,k)*Xi(phi1(j,k), phi2(j,k))-2*Z*(1-c(j,k))*(phi1(j,k)*phi1(j,k) + phi2(j,k)*phi2(j,k)));
        
      