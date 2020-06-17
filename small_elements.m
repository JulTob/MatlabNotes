function out = small_elements (in)
%Identifies the elements smaller than the product of indexes
[row,col]=size(in);

ir=1;
out=[];

for c=1:col
    for r=1:row
        if in(r,c)<r*c
            out(ir,1)=r;
            out(ir,2)=c;
            ir=ir+1;
        end
    end   
end



end
