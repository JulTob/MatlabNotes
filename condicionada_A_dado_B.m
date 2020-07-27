function Is = condicionada_A_dado_B (veces)

registro= probabilidad_cualquier (veces);
p_espadas=probabilidad_palo(veces);
p_interseccion=0;

for i=3:3:13
    
    aux= registro(2,i);
    p_interseccion=p_interseccion+aux;


end
    Is=p_interseccion/p_espadas;

end