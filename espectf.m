function e=espectf(x);
%
% e = espectf(x)
%
%       Calcula el espectro de una señal aperiódica.
%
%       (c) Adrian J. Torregrosa
%           Angel A. San Blas
%           Jose Vte. Morro



f=(-50:0.05:50)';
e = fftshift(fft(x))/100;
e = e.*exp(j*2*pi*f*999*.01);
%%%%
%%%% este es el parche para las deltas pues no habría que multiplicar por 10
%%%%
cx = find(x==0);        % encuentra los ceros
dcx = diff(cx);         % calcula distancia entre ceros
ndx = length(find(dcx==2));     % distancia 2 indica hay delta
if (ndx>0)
        e=e*100/2;
end
%%%
%%%
%%%


% fin función
