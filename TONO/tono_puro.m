%%%%%     PERIODICIDAD %%%%%

clear all;
clc


fs = 44100;
t0=0:1/fs:2;

%for f=[100 400 440 600 800]
f=440;
x=sin(2*pi*f*t0);
f=figure;
plot(x(1:1000));
title('Tono puro');
xlabel('Pulse INTRO para continuar');
soundsc(x,fs);
pause
close(f)
%end

eleccion=0;