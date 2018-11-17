clear all;
clc;
clf;

N = 128;
dx = 1.0;
c = zeros(N,1);
#m = 4.0; #change it

for i = (N/4)+1:(3*N)/4
  #c(i) = 0.5*(1+ sin(2*pi*m*i*dx/N));
  c(i) = 1.0;
endfor

plot(c, 'r;initial;');
hold on

halfN = N/2;

delk = 2*pi/N;
dt = 0.5;

for m = 1:4000
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

#energy calculation
chat = fft(c);
 for i  =1:N
    if ((i-1)<= halfN) k = (i-1)*delk;
    endif
    if ((i-1)> halfN) k = (i-N-1)*delk;
  endif
  chat(i)=complex(0,1)*k*chat(i);
endfor

cprime = real(ifft(chat));
energy1 = 0.0;
energy2 = 0.0;
kappa = 1.0;
A=1.0;
for i= 1:N
  energy1 = energy1+A*c(i)*c(i)*(1-c(i))*(1-c
  (i));
 energy2 = energy2 + kappa*cprime(i)*cprime(i); 
endfor

0.5*energy1
0.5*energy2
0.5*(energy1+energy2)