function w = move_me( v,a )
% MOVE_ME:   Mueve las "a" al final del vector v
%   si no entra a es cero
w=v;
n=length(v);

if nargin==1
    a=0;
end

m=n;
l=1;
for i=1:n
    if v(i)==a
        w(m)=a;
        m=m-1;
    else
        w(l)=v(i);
        l=l+1;
    end
end


end
