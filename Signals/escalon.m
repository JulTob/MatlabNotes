function u=escalon(t)
%
% u = escalon(t)
%
%       Genera una señal escalon
%
%       (c) Angel A. San Blas
%           Jose V. Morro


l = length(t);
a = find(t>=0);
u = zeros(l,1);
u(a) = ones(length(a),1);
if (t(1)>t(2))
         u(1:l-1) = u(2:l);      % si -t, en t=0 vale 0, asi evito solape
end

% fin de la función
