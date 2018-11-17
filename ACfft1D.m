clear all;
clc;
clf;
kappa = 1.0;
A = 1.0;
N = 128;
dx = 1.0;
c = zeros(N,1);

for i = (N/4)+1:3*N/4
  c(i) = 0.5+0.001*(1-rand());
endfor
plot(c, 'r; Initial;');
hold on
halfN = N/2;
delk = 2*pi/N;
dt  = 0.5;

for m = 1:4000
  g = 2.*c.*(1.-c).*(1.-2.*c);
  chat = fft(c);
  ghat = fft(g);
  for i = 1:N
    if ((i-1)<=halfN) k=((i-1)*delk);
    endif
    if ((i-1)>halfN) k=(i-N-1)*delk;
    endif
    k2 = k*k;
    k4 = k2*k2;
    chat(i) = (chat(i)-dt*k2*ghat(i))/(1+2*k4*dt);
  endfor
  c = real(ifft(chat));
endfor
plot(c)

chat = fft(c);
for i = 1:N
  if ((i-1)<=halfN) k = (i-1)*delk;
  endif
  if ((i-1)>halfN) k = (i-N-1)*delk;
  endif
  chat(i) = complex(0,1)*k*chat(i);
endfor
cprime = real(ifft(chat));
energy1 = 0.0;
energy2 = 0.0;
#kappa = 3.0;
#A = 1.0;

for i = 1:N
  energy1=energy1+A*c(i)*c(i)*(1-c(i))*(1-c(i));
  energy2=energy2+kappa*cprime(i)*cprime(i);
endfor

0.5*energy1
0.5*energy2
0.5*(energy1+energy2)