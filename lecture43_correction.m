clear all;
clf;

N = 128;
D = 1;
delt = 1.0;
Tot_t = 2000;
intv_t = 500;
M=1;
p = 2;

c = zeros(N,1);
A = zeros((Tot_t/intv_t)+1, 1);

for j = 1:N
  c(j) = 0.5*(1+sin(2*pi*M*j/N));
endfor
avg_comp = mean(c);

A(1,1) = 1;
A(1,2) = avg_comp;

hold on;
plot(c, '-ro', 'linewidth', 2);

halfN = N/2;
delk = 2*pi/N;

for m = 1: Tot_t
  chat = fft(c);
  
  for i = 1:N
    if (i<halfN) k = (i-1)*delk;
    endif
    if (i>=halfN) k = (i-N)*delk;
    endif
    
    chat(i) = chat(i)/(1+D*k*k*delt);
  endfor
  c = real(ifft(chat));
  
  if (mod(m, intv_t)==0)
    avg_comp = mean(c);
    
    A(p,1) = m+1;
    A(p,2) = avg_comp;
    figure(1);
    if (p==2)
      plot(c, '-2o')
    endif
    
     if (p==3)
      plot(c, '-3o')
    endif
    
     if (p==4)
      plot(c, '-4o')
    endif
     if (p==5)
      plot(c, '-5o')
    endif
    p = p+1;
  endif
  
endfor

grid on;
ax = gca;

set(ax, 'fontsize', 20, 'linewidth', 1.5);
axis normal;
xlim([1 128]);
ylim([-0.2 1.2]);
xlabel 'x';
ylabel 'c(x)';
legend('Initial Profile', 'TIme: 500', 'TIme: 1000', 'TIme: 1500', 'TIme: 2000', 'location', 'northeast');
print -depsc fig1-tot.eps

hold off
figure(2);
plot(A(:,1), A(:,2), '-1o', 'linewidth', 1.5);
grid on;
ax = gca;
set(ax, 'fontsize', 20, 'linewidth', 1.5);
axis square;
xlim([1 2000]);
ylim([0.2 0.7]);
xlabel 'time';
ylabel 'average composition';
print -depsc fig1-comp.eps;

