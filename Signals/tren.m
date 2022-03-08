function i = tren(t,T)
%
% i = tren(t,T)
%
%       Genera un tren de impulsos de periodo T
%
%       (c) Angel A. San Blas
%           Jose V. Morro


l = length(t);
p = find(t==T);         % posicion intante T
a = find(t==0);         % posicion intante 0
m = p-a;                % nº ptos entre ambas (es el nuevo T)

k1 = fix((a-1)/m);
k2 = fix((l-a)/m);

i = zeros(l,1);
o = ones(k1+k2+1,1);
i(a-k1*m:m:a+k2*m)=o;

