function y=deriva(x)
%
% y = deriva(x)
%
%       Calcula la derivada de la señal 'x'.
%
%       (c) Angel A. San Blas
%           Jose V. Morro

l = length(x);
y = zeros(l,1);
y(2:l) = diff(x);       % salida tiene id nº ptos que entrada
%y=y*100;

%%%%
%%%% este es el parche para las deltas pues no habría que multiplicar por 10
%%%%
%cy = find(y==0);        % encuentra los ceros
%dcy = diff(cy);         % calcula distancia entre ceros
%ndy = length(find(dcy==2));     % distancia 2 indica hay delta
%if (ndy>0)
%        y=y/100;
%end
%%%
%%%
%%%

%%% pruebo otro parche para las deltas
cy = find(abs(y)>.5);
y=y*100;
y(cy)=y(cy)/100;


% fin de la función