%%%%%     PERIODICIDAD %%%%%

clear all;
clc


fs=1e6;
t0=0:1/fs:2;

%for f=[100 400 440 600 800]
f=10;
x=sin(2*pi*f*t0);
f=figure;
plot(x(1:100000));
title('Señal de 10Hz');
xlabel('Pulse INTRO para continuar');
soundsc(x,fs);
pause
close(f)
%end

eleccion=0;