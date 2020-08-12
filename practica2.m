%Script para la realización de cálculos de la práctica 2 de Amp de SyS
%Par utilizar como un script que solicita entradas descomentar desde aquí

%fprintf('\n Asegurese de tener el vector s[n] definido como un vector de números\n');

%fprintf('\n Entre 1 y lenght(s):\n');
%n0=input('Introduce la posición central de la muestra, donde n=0 en s[n]: ');
%fprintf('\n Ahora define el intervalo de muestreo:');
%ninf=input('Introduce el valor inferior del intervalo de n: ');
%nsup=input('Introduce el valor superior del intervalo de n: ');

%A aquí

%Recuerda definir n0, ninf, nsup antes de llamar.

n=ninf:nsup;

N=length(n);

Ns=length(s);
nsinf= -(n0-1);
nssup= Ns-n0;

s1=[zeros(1,abs(ninf-nsinf)), s, zeros(1,abs(nsup-nssup))];
S1=fftshift(fft(s1,N));

S=fftshift(fft(s,N));

% Gráficos para ayudar a programar y visualizar el resultado
%figure(1);
%stem(n,s1,'-o');
%figure(2);
%stem(n,abs(S1),'ro');
%figure(3);
%compass(S1,'-r');
%figure(4);
%stem(n,abs(S),'ro');
