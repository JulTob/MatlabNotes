clear;
x=23
class(x)
rng(0); z=rand(3,4);
whos
class('supdude')
isa(x,'double') %is x a 'double' ?

%Range 
% intmax y intmin max y min entero 
% realmax el numero mas grande
% realmin el numero más pequeño (cercano a cero, no de los negativos)
% intmin('int32')   %para min de tipo int
% intmax('uint8')   %para max de tipo int
% realmax('double') %para max real
% realmin('single') %para menor real


x=single(23.45)
n=int8(-16)
m=uint16(3213)
whos

%out of range
u=int8(500)
u=uint8(500)
u=uint8(-1)
class(u)
u=uint8(2.3)

