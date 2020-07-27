function is= probabilidad_una_cualquiera(Veces)

registro=probabilidad_cualquier(Veces);
palo=N_Random_In_Range(1,4,1);
valor=N_Random_In_Range(1,10,1);
if valor>7
    valor=valor+2;
end
is=registro(palo,valor);


end