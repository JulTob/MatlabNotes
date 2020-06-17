% % logical indexing
wuuut=logical([-1 9.5 pi 0 0.0 true false])

c= [true false true false]
a=1:4

waaaat=a(c)

%Sustituye los elementos mayor q .1 por su raiz
rng(0); A=randn(5);
A(A>0.1)=sqrt(A(A>0.1))
