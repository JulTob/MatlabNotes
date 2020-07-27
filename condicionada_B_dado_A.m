function Is = condicionada_B_dado_A (veces)

registro= probabilidad_cualquier (veces);
p_mult=probabilidad_mult_tres(veces);
p_interseccion=0;

for i=3:3:13
    
    aux= registro(2,i);
    p_interseccion=p_interseccion+aux;


end
    Is=p_interseccion/p_mult;

end