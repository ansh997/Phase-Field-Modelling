#clear the memorry 
clf
clear all
#define sysytem size
N=128;
D=1;
delt = 1.0;

c = zeros(N,1);
M=2;

for j=1:N
  c(j,1) = 0.5*(1+sin(2*pi*M*j/N)); # significance of 0.5
endfor
#plot initial profile
plot(c,'rs');
hold on

# for periodic BC implementation

#define half length of the box
halfN=N/2;

#define the grid spacing in the fourier space

delk = 2*pi/N;

for k = 1:20  %https://onlinecourses.nptel.ac.in/noc18_mm17/unit?unit=10&lesson=12
  for m=1:1000
    ctilde = fft(c);
    for i = 1:N
      #periodic BC implementation
      if (i<halfN) k = i*delk;
      endif
      if (i>=halfN) k =(i-N)*delk;
      endif
      ctilde(i,1) = ctilde(i,1)/(1+D*k*k*delt);
    endfor
  endfor


c = real(ifft(ctilde));
plot(c, 'b*')
endfor
print -djpg Implicitspectral.jpg