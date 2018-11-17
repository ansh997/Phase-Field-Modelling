clf
clear all

delt = 0.1;
delx = 0.5;
D = 1;

alpha = D*delt/(delx*delx);

c = zeros(101,1);
c(1) = 1.0;
C(101) = 0.0;

plot(c, 'r-;Initial Profile;');

ax = gca;
set(ax,'linewidth',2.5);
axis('square');

hold on

for k=1:20
  for j=1:500
    for i=2:100
      c(i)=c(i)*(1-2*alpha)+alpha*(c(i-1)+c(i+1));
    endfor
  endfor
  plot(c, 'b');
endfor

print -depsc ExplicitZeroC.eps