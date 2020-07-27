function [ Out ] = GaussNoise( Media, dev, T )
%GaussNoise: Devueleve ruido gausiano, en vectores VERTICALES.
    % Tendrá Media como valor medio, y dev como desviacion tipica
    % durante T segundos

Ts=1/1000;      %Periodo de Muestreo
ts=0:Ts:T;     %Vector tiempo muestreado


Out = Media +  sqrt(dev)*randn(size(ts));
 


end