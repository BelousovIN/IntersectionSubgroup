# Intersections Sylow p-subgroups in finite simple sporadic groups


## Exhaustive search

$p$


```gap
gap> _Orb:=function(IdG, p)
	local G,H,Cl_Syl2, Intersect;
	
	if IdG in ["M11","M23","M24", "Co1", "Co2", "Co3", "Th", "Fi23", "B", "M", "J1",  "Ru", "J4", "Ly", "B", "M"] then
		G:=SimpleGroup(IdG);
	fi;
	
	if IdG in ["M12","M22",	"HS", "J2", "McL", "Suz", "He", "HN", "Fi22", "Fi24", "ON", "J3"] then
		G:=AutomorphismGroup(SimpleGroup(IdG));
	fi;
	

	H:=SylowSubgroup( G, p );
		Cl_Syl2:=ConjugateSubgroups(G,H);
		Intersect:=Filtered(Cl_Syl2, x -> Order(Intersection(x,Cl_Syl2[1]))=1 );;
		return Size(Intersect)/Order(H);
end;
```

The function \_Orb that implements the exhaustive search algorithm  for $p=2$  gives the answer for groups $M_{11}, M_{12}, M_{22}, M_{23}, M_{24}, HS, J_{2}$
```gap
gap> _Orb("M11",2);
27
```

```gap
gap> _Orb("M12",2);
6
```
```gap
gap> _Orb("M22",2);
5
```
```gap
gap> _Orb("M23",2);
522
```

```gap
gap> _Orb("M24",2);
163
```
```gap
gap> _Orb("HS",2);
39
```
```gap
gap> _Orb("J2",2);
10
```

The function \_Orb for $p=2$ does not give an answer for groups $Co_1$, $Co_2$, $Co_3$, $McL$, $Suz$
