function y = convol(x,h)
%
%  y = convol(x,h)
%
%       Calcula la convolución entre 'x' y 'h'
%
%       (c) Ángel A. San Blas
%           Adrian J. Torregrosa
%           José Vicente Morro

lx = length(x);
lh = length(h);
if (lx~=lh)
        error('x o h esta mal definida');
end

y = zeros(lx,1);
nzx = find(x);
nzh = find(h);
xx = x(nzx(1):nzx(length(nzx)));
hh = h(nzh(1):nzh(length(nzh)));
c = conv(xx,hh)/100;            %divido por 100 por el muestreo del tpo
lc = length(c);                 %hay un problema con las deltas (mira el parche)

inic = nzx(1)+nzh(1);   % -1 sería lo correcto en discreto
finc = inic+lc-1;
norm = (lx-1)/2;
iniy = inic-norm;
finy = finc-norm;
if (iniy < 1)
        ci = 1-iniy+1;
        iniy = 1;
else
        ci = 1;
end
if (finy > lx)
        cf = lc-(finy-lx);
        finy = lx;
else
        cf = lc;
end

y(iniy:finy) = c(ci:cf);

%%%%
%%%% este es el parche para las deltas pues no habría que dividir por 100
%%%%
cx = find(x==0);        % encuentra los ceros
ch = find(h==0);
dcx = diff(cx);         % calcula distancia entre ceros
dch = diff(ch);
ndx = length(find(dcx==2));     % distancia 2 indica hay delta
ndh = length(find(dch==2));
if ((ndx>0) | (ndh>0))
        y=y*100;
end
%%%
%%%
%%%

% fin de la función
