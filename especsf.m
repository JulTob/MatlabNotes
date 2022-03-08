function e = especsf(x)
%
% e = especsf(x)
%
%       Calcula el espectro de una señal periódica.
%
%       (c) Adrian J. Torregrosa
%           Angel A. San Blas
%           Jose Vte. Morro

l = length(x);
e = fftshift(fft(x)) / l;
