function wave= triangle_wave (precision)
%Takes precision, or number of steps, to compute a triangular wave

t0=0;
tf=4*pi;
delt_t=1/1000;
t=0:(tf-t0)*delt_t:tf;
wave=zeros(size(t));
for k=0:precision
    signo=(-1)^k;
    weight=(2*k+1)^2;
    wsin=sin((2*k+1).*t);
    step=signo*wsin/weight;
    wave=wave+step;

end
