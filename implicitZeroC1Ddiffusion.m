clf
clear all

N = 101
delt = 0.1;
delx = 0.5;
D = 1;

alpha = D*delt/(delx*delx);

c = zeros(N,1);
c(1) = 1.0;
C(101) = 0.0;

plot(c, 'r-;Initial Profile;');

ax = gca;
set(ax,'linewidth',4.0);
axis('square');

hold on

for i=1:N
  cold(i,1)=c(i,1);
endfor
A = zeros(N,N);
A(1,1) = 1.0;
A(N,N) = 1.0;
#Diagonal Terms
for i=2:N-1
  A(i,i) = 1.+2*alpha;
endfor
#Lower diagonal terms
for i=2:N-1
  A(i,i-1) = -alpha;
endfor
#upperDiagonal terms
for i=3:N
  A(i-1,i) = -alpha;
endfor

for k=1:20
  for j=1:500
    c=A\cold;
    for i=1:N
      cold(i,1) = c(i,1);
    endfor
  endfor
  plot(c, 'b');
endfor

print -depsc ImplicitZer0C.eps