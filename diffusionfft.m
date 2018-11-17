clear all;
clc;
clf;

N = 32;
dx = 1.0;
m = 1;

for i = 1:N
  c(i) = 0.5*(1+ sin(2*pi*m*i*dx/N));
endfor

plot(c, 'r;initial;');
hold on

halfN = N/2;

delk = 2*pi/N;
dt = 0.5;

for m = 1:80
  chat = fft(c);
  for i  =1:N
    if ((i-1)<= halfN) k = (i-1)*delk;
    endif
    if ((i-1)> halfN) k = (i-N-1)*delk;
    endif
    K2 = k*k;
    chat(i) = chat(i)/(1+K2*dt);
  endfor
   c = real(ifft(chat));
endfor

plot(c)

  