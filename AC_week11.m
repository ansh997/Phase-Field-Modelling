clear all;
clc;
clf;

N=128;
dx = 1.0;
m=1;

for i = 1:N
  c(i) = 0.5+0.001*(1-rand());
endfor
plot(c, 'r; Initial;');

hold on

halfN = N/2;
delk = 2*pi/N;
dt = 0.02;
for m = 1:80
  chat = fft(c)
  for i = 1:N
    if ((i-1)<=halfN) k = (i-1)*delk;
    endif 
    if ((i-1)>halfN) k = (i-N-1)*delk;
    endif
    k2 = k*k;
    k4 = k2*k2;
    chat(i) = (chat(i))/(1+k2*dt);
  endfor
  c=real(ifft(chat));
endfor

plot(c, 'b; Final;');

  
    