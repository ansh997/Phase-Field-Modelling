#explicit methods
#clean the figure and clear all the data
clf
clear all
#define the parameter
delt = 0.1;
delx = 0.5;
D = 1.0;

alpha = D*delt/(delx*delx);

#Set the initial profile
c = zeros(101,1);
c(1) = 1.0;

#plot the in initial profile
plot(c, 'r-;Initial profile;');
#get handle
ax = gca;

set(ax,"linewidth", 2.0);
axis("square");

#plot future plots

hold on

for k = 1:20
  for j=1:500
    for i=2:100
      c(i) = c(i)*(1-2*alpha) + alpha*(c(i-1)+c(i+1));
    endfor
    c(101) = c(i)*(1-2*alpha) + 2*alpha*(c(i-1));
  endfor
  plot(c, 'b')
endfor

#save figure
#print -depsc ExplicitNoflux.epss