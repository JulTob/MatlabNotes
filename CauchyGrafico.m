function CauchyGrafico( y0 )
%practica 2
%   apartado a),b)

D=(inline('sin(y)','y'));

ode45(D,[0,5],y0)

hold on







if y0>pi && y0<=2*pi

subplot(4,1,1)
end

if y0>0 && y0<=pi
subplot(4,1,2)
end

if y0>-(pi) && y0<=0
subplot(4,1,3)
end

if y0>(-2)*pi && y0<=(-1)*pi
subplot(4,1,4)
end

end

