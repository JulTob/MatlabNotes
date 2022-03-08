function d=delta(t)
%
% d = delta(t)
%
%       Genera una delta en t=0
%
%       (c) Angel A. San Blas
%           Jose V. Morro

l = length(t);
a = find((t==0));        %| (abs(t)<1e-10));
d = zeros(l,1);
d(a) = 1;

% fin de la funci¢n