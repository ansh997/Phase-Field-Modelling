clear all;
clc;
clf;

for i=1:141
  if (i==1) phi(i) = -0.2;
  else phi(i) = phi(i-1)+0.01;
endif

function y = f(phi)
  y = phi*phi*phi*(10-15*phi+6*phi*phi);
endfunction

if (phi(i)<0) W(i) = 0.0;
elseif (phi(i)>1) W(i) = 1.0;
else W(i) = f(phi(i));
endif
endfor
plot(phi,W)