clear all;
clc;
clf;
more off  %movie-like simulation

Nx = 64;
Ny = 64;

for i = 1:Nx
  for j = 1:Ny
    c(i,j) = 0.5 + 0.1*(0.5-rand());
  endfor
endfor

mesh(c);
view(2);

pause(0)
dt = 0.5;
halfNx = Nx/2;
halfNy = Ny/2;
delkx = 2*pi / Nx;
delky = 2*pi/Ny;
A = 1.0;
M = 1.0;
kappa = 1.0;

for m = 1:10
  for n = 1:20
    g = 2.*A.*c.*(1-c).*(1-2.*c);
    ghat = fft2(g);
    chat = fft2(c);
    
    for i = 1:Nx
      if ((i-1)<=halfNx) kx = (i-1)*delkx;
      endif
      if ((i-1)>halfNx) kx = (i-Nx-1)*delkx;
      endif 
      for j = 1:Ny
        if ((i-1)<=halfNy) ky = (i-1)*delky;
        endif
        if ((i-1)>halfNy) ky = (i-Ny-1)*delky;
      endif
      k2 = kx*kx + ky*ky;
      k4 = k2*k2;
      
      chat(i,j) = (chat(i,j)-M*dt*k2*ghat(i,j))/(1+2*M*kappa*k4*dt);
      endfor
    endfor
    c = real(ifft2(chat));
  endfor
  mesh(c);
  view(2);
  pause(0);
endfor
