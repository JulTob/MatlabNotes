function [ Out ] = CosNoised(  Media, dev )
%CosNoised: Coseno con frecuencia 10 Hz
%   y Amplitud 10 V
%   con un ruido gausiano
fc= 10;
Amp= 10;

Ts=1/1000;      %Periodo de Muestreo
T=1;            %Longitud temporal
ts=0:Ts:T;     %Vector tiempo muestreado


Out= Amp*cos(2*pi*fc*ts)+ GaussNoise( Media, dev, T );

plot(ts, Out);
end

