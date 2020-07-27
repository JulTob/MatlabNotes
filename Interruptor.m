function [ Out ] = Interruptor( t, TAct )
% Interruptor que se activa en TAct 
if t < TAct
    Out= 0;
else
    Out= 1;
end

end

