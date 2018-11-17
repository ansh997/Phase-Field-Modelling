clear all;
clc;
clf;

N = 32;
dx = 1.0;
m = 4.0; #change it

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
  g = 2.*c.*(1.-c).*(1.-2.*c);
  ghat = fft(g);
  for i  =1:N
    if ((i-1)<= halfN) k = (i-1)*delk;
    endif
    if ((i-1)> halfN) k = (i-N-1)*delk;
    endif
    K2 = k*k;
    K4 = K2*K2;
    chat(i) = (chat(i)- dt*K2*ghat(i))/(1+2*K4*dt);
  endfor
   c = real(ifft(chat));
endfor

plot(c)
