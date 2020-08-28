function value = singular(P)
t = [0:0.01:2*pi];
x = cos(t); y=sin(t); C=[x;y];
AC = P*C;
figure, plot(x,y,'r',AC(1,:),AC(2,:),'b'), axis('equal'), axis([-2 2 -2 2])
[U,S,V] = svd(P);
figure, compass(V(1,:),V(2,:),'r')
E = P*V;
figure, compass(E(1,:),E(2,:),'b')
end


