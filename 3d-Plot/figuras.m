clear all


%Objective function f= (x-2)^ + (y-1)^2 
%Constraint x+y=-2

%Contour Plot + Constraint + Gradient
ezsurf('(x-2)^2+(y-1)^2')
ezcontourf('(x-2)^2+(y-1)^2')
[x,y] = meshgrid(-6:0.5:6,-6:0.5:6);
z=(x-2).^2+(y-1).^2;

[px,py] = gradient(z,0.1,0.1);
contour(x,y,z); hold on
ezplot('(x-2).^2+(y-1).^2',[-6 6 -6 6]); hold on
fh = @(x) -x-2;
fplot(fh,[-6,6]); hold on
quiver(x,y,px,py)
