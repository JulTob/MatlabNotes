function p=pulso(t)
%
% p = pulso(t)
% 
%       Genera un pulso de anchura 1 centrado en t=0.
%
%       (c) Angel A. San Blas
%           Jose V. Morro

M=1;    % M en la version 1 venia de pulso(t,M)
l = length(t);                    % uso M explicado bajo
a = find((t>=-M/2) & (t<=M/2));   % zona donde va el pulso
p = zeros(l,1);
p(a) = ones(length(a),1);
if (t(1)<t(2))			  % sin inversión
	p(find(t==M/2)) = 0;      % el escalón alto vale 0
else				  % con inversión: -t
	p(find(t==-M/2)) = 0;     % el escalón alto vale 0
end

%        t = 0 1 2 3 4 5 6 7 8
%       2t = 0 2 4 6 8 10 ...
%  si busco en 2t el 8 obtengo la mitad de puntos que antes: compresión.
