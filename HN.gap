Read("aHN.gap");
Read("bHN.gap");


G:=Group(a,b);



Syl2:=SylowSubgroup( G, 2 );
Syl19:=SylowSubgroup(G,19);

orb1:=Syl2^Syl19;


Intersect1:=Filtered(  orb1, x -> Order(Intersection(x,Syl2))=1 );

#orb2:=Orbits(Syl2,Intersect1);

pary:=[];
for h in Syl2 do
	for a1 in Syl19 do
		for a2 in Syl19 do
			if a1*h*a2 in Normalizer(G,Syl2) then
				AddSet(pary, AsSet([a1,a2]));
			fi;
		od;
	od;
od;



H\in Syl_2(J2))

S=\{A\in  Syl_2(Aut(J2)) \ | \ |A\cap H|=1 \}

|S|=2560

Сущетсвует точно 10 орбит (длины 256) под действием H на S.




