function y=probx(t)
%       (c) Angel A. San Blas
%           Jose V. Morro

y=pulso(t-0.5)+2*pulso(t-1.5)+(t+1).*pulso(t+0.5)+(t-3).*pulso(t-2.5);
