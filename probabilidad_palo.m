function Valor= probabilidad_palo (veces)

registro= probabilidad_cualquier (veces);
    Valor=0;

    p_espadas= registro(2,:);
   Valor= sum(p_espadas);

end