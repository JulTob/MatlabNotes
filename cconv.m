function Is= cconv( x, h, N)
%Código modificado del ejemplo de mathwork.com, el proveedor oficial de Matlab

cx=[ x zeros(1,N-length(x)) ];
ch=[ h zeros(1,N-length(h)) ];
cX=fft(cx);

cH=fft(ch);
C=cX.*cH;
Is= ifft(C);


end