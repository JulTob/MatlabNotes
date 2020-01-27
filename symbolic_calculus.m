syms r p q
x=r*sin(p)*cos(q);
y=r*sin(p)*sin(q);
z=r*cos(p);


fx1=diff(x,r);
fy1=diff(y,r);
fz1=diff(z,r);

fx2=diff(x,p);
fy2=diff(y,p);
fz2=diff(z,p);

fx3=diff(x,q);
fy3=diff(y,q);
fz3=diff(z,q);

u1=[fx1 fy1 fz1];
u2=[fx2 fy2 fz2];
u3=[fx3 fy3 fz3];
