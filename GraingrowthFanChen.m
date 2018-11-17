clear all;
clf;
clc;
more off

p =6;
kappa1 = 1.0;
kappa2 = 1.0;
kappa3 = 1.0;
kappa4 = 1.0;
kappa5 = 1.0;
kappa6 = 1.0;
L1 = 1.0;
L2 = 1.0;
L3 = 1.0;
L4 = 1.0;
L5 = 1.0;
L6 = 1.0;
alpha = 1.0;
beta = 1.0;
gamma = 1.0;
N =64;
dx = 1.0;
phi = unidrnd(6,N,N);
eta1 = zeros(N,N);
eta2 = zeros(N,N);
eta3 = zeros(N,N);
eta4 = zeros(N,N);
eta5 = zeros(N,N);
eta6 = zeros(N,N);

for i = 1:N
  for j = 1:N
    if ((phi(i,j) == 1)) eta1(i,j) 1.0;
      elseif ((phi(i,j) == 2)) eta2(i,j) 1.0;
      elseif ((phi(i,j) == 3)) eta3(i,j) 1.0;
      elseif ((phi(i,j) == 4)) eta4(i,j) 1.0;
      elseif ((phi(i,j) == 5)) eta5(i,j) 1.0;
      elseif ((phi(i,j) == 6)) eta6(i,j) 1.0;
    endif
  endfor
endfor
b = zeros(N,N);

for k = 1:N
  for l = 1:N
    #BIGGest implemnteation









