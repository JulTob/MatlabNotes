
function out=spiral_diag_sum(n)
%% out=spiral_diag_sum(n)
%Gives the sum of the diagonals of the spiral matrix nxn
% '21'  22  23  24 '25'
%  20  '7'  8   '9' 10
%  19   6  '1'   2  11
%  18  '5'  4   '3' 12
% '17' 16   15  14 '13'

sum=1;
last=1;
if n>1
    n=(n+1)/2
for stp=1:(n-1)
for count4=1:4
    now=last+2*stp;
    sum=sum+now;
    last=now;
end  
end
end



out=sum;

end
