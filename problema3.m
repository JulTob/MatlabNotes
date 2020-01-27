function problema3
n=input('Numero de lados n');
r=input('Radio r');
disp(['Introduce las coordenadas (p,q) del centro del polígono']);
p=input('Coordenada p: ');
q=input('Coordenada q: ');
disp(['Dame los coeficientes a,b,c de la recta ax+by+c=0 de simetria']);
a=input('Coeficiente a');
b=input('Coeficiente b');
c=input('Coeficiente c');
regular(n, r, p, q);
for k=1:lados
    plot(A(1,k),A(2,k));
end
refleja(A,a,b,c);
end
