# Intersections Sylow p-subgroups in finite simple sporadic groups


## Exhaustive search

The _Orb function implements an exhaustive enumeration algorithm for finding the number of all orbits under the action of a Sylow $p$-subgroup $H$ on the set of all Sylow $p$-subgroups of a group $G$ that intersect $H$ at one, where $G$ is a group isomorphic to the automorphism group of a simple sporadic group.


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

The \_Orb function for $p=2$ gives the answer for groups $M_{11}$, $M_{12}$, $M_{22}$, $M_{23}$, $M_{24}$, $HS$, $J_{2}$, $J_1$
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

```gap
gap> _Orb("J1",2);
127
```



The \_Orb function for $p=2$ does not give an answer for groups $Co_1$, $Co_2$, $Co_3$, $McL$, $Suz$, $He$, $HN$, $Th$,	$Fi_{22}$, $Fi_{23}$, $Fi_{24}'$, $B$, $M$, $O'N$, $J_3$, $Ru$, $J_4$, $Ly$. 


## Finding a Lower Bound for Orb_p(G) Using the Sylow p-Subgroup Center Centralizer

Let a group $G$ isomorphic to the automorphism group of a simple sporadic group and its Sylow $p$-subgroup $H$ be given. If there exists an element $g$ from a Sylow $q$-subgroup $A$ such that $C\cap H^g=1$, then $Orb_p(G)\ge |C|/|N_G(H)|$ .

The IntersectOrders function finds all the intersection orders of $C\cap H^g$, where $g$ runs through all elements of $A$, outputs an array of these orders, and if there exists an element $g$ with the above property, it takes the value $|C |/|N_G(H)|$. Otherwise, it takes the value $-1$.  

```gap
gap> IntersectOrders:=function(IdG, p, q)
	local G,H, A, C, orbH;
	
	if IdG in ["M11","M23","M24", "Co1", "Co2", "Co3", "Th", "Fi23", "B", "M", "J1",  "Ru", "J4", "Ly", "B", "M"] then
		G:=AtlasGroup(IdG);
	fi;
	
	if IdG in ["M12","M22",	"HS", "J2", "McL", "Suz", "He", "HN", "Fi22", "Fi24", "O'N", "J3"] then
		G:=AtlasGroup(Concatenation(IdG,".2"));
	fi;
	
	H:=SylowSubgroup(G,p);
	A:=SylowSubgroup(G,q);
	C:=Centralizer(G,Center(H));
	orbH:=H^A;
	if 1 in List(orbH, x-> Order(Intersection(x,C))) then 
		Print(List(orbH, x-> Order(Intersection(x,C))), "\n");
		return Order(C)/Order(Normalizer(G,H));
	else
		Print(List(orbH, x-> Order(Intersection(x,C))), "\n");
		return -1;
	fi;
	
end;
```


```gap
gap> IntersectOrders("M11",2,11);
[ 16, 2, 1, 2, 1, 1, 1, 1, 2, 1, 2 ]
3
```

```gap
gap> IntersectOrders("M12",2,11);
[ 128, 2, 1, 1, 2, 2, 2, 1, 1, 1, 4 ]
3
```

```gap
gap> IntersectOrders("M22",2,11);
[ 256, 2, 2, 16, 2, 2, 4, 1, 16, 2, 4 ]
3
```

```gap
gap> IntersectOrders("M23",2,23);
[ 128, 2, 1, 2, 1, 1, 2, 1, 1, 4, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 1 ]
21
```

```gap
IntersectOrders("M24",2,23);
[ 1024, 2, 2, 1, 2, 2, 1, 64, 2, 4, 2, 2, 1, 8, 2, 1, 64, 1, 2, 1, 1, 1, 4 ]
21
```

```gap
gap> IntersectOrders("HS",2,11);
[ 1024, 8, 4, 8, 2, 8, 4, 4, 16, 4, 8 ]
-1
```

```gap
gap> IntersectOrders("J2",2,7);
[ 256, 2, 8, 4, 4, 2, 8 ]
-1
```

```gap
gap> IntersectOrders("Co1",2,23);
[ 2097152, 4, 1, 4, 32, 2, 2, 1, 32, 16, 2, 2, 8, 1, 2, 128, 4, 4, 4, 32, 4, 1, 4 ]
42525
```

```gap
gap> IntersectOrders("Co2",2,23);
[ 262144, 32, 32, 64, 128, 64, 32, 32, 256, 64, 64, 32, 32, 16, 256, 64, 64, 256, 32, 64, 64, 16, 32 ]
-1
```

```gap
gap> IntersectOrders("Co2",2,11);
[ 262144, 64, 128, 64, 32, 32, 16, 16, 64, 32, 64 ]
-1
```

```gap
gap> IntersectOrders("Co2",2,7);
[ 262144, 64, 32, 64, 128, 64, 16 ]
-1
```

```gap
gap> IntersectOrders("Co3",2,23);
[ 1024, 1, 1, 1, 2, 1, 1, 1, 2, 2, 1, 4, 2, 1, 2, 2, 2, 1, 1, 1, 1, 1, 2 ]
2835
```

```gap
gap> IntersectOrders("McL",2,11);
[ 256, 2, 2, 2, 1, 2, 1, 1, 2, 1, 1 ]
315
```

```gap
gap> IntersectOrders("Suz",2,13);
[ 16384, 1, 8, 1, 1, 4, 1, 2, 16, 2, 1, 8, 2 ]
405
```

```gap
gap> IntersectOrders("He",2,17);
[ 2048, 1, 1, 4, 1, 2, 1, 4, 1, 1, 2, 1, 1, 2, 8, 1, 1 ]
21
```

```gap
gap> IntersectOrders("HN",2,19);
[ 32768, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
225
```
