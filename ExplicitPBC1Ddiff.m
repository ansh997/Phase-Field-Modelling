clf
clear all

delt = 0.01;
delx = 0.5;
D = 1.0;

alpha = D*delt/(delx*delx);

N=128;
#no of wavelength
m= 2.0;
for i=1:N
  oldc(i) = 0.5*(1+sin(2*pi*m*i*delx/N)); 
  newc(i) = 0.0;
endfor

#
plot(oldc);
hold on

for  k = 1:200
  for j = 1:5000
    for i=1:N
      w=i-1;
      e=i+1;
      #implementation of PBC
      if (w==0) w=w+N;
      endif
      if(e==N+1) e=e-N;
    endif
    newc(i) = oldc(i)*(1-2*alpha) + alpha*((oldc(w))+oldc(e));
  endfor
  for i=1:N
    oldc(i)=newc(i);
  endfor
endfor
plot(oldc,);
endfor
print -depsc ExplicitPBC1Ddiff.eps
 
    
    
      
  
  