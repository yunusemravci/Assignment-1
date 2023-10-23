$ title transportation problem
Sets
    i 'cities' /1, 2/
    j 'airports' /1, 2/;

Parameters
    a(i) 'demand of city'
    /1 100
     2 200/
    b(j) 'capacity of airport'
    /1 150
     2 150/
    c(i,j) 'driving time from city to airport'
    /1.1 1, 1.2 2
     2.1 1, 2.2 1/;

Variables
    x(i,j) 'passengers traveling from city i to airport j'
    z 'total travel cost';

Equations
    obj 'objective function'
    demand(i) 'demand constraint'
    supply(j) 'supply constraint';

obj.. z =e= sum((i,j), x(i,j)*c(i,j));
demand(i).. sum(j, x(i,j)) =e= a(i);
supply(j).. sum(i, x(i,j)) =e= b(j);

x.lo(i,j) = 0;

Model transport /all/;

Solve transport using lp minimizing z;

Display x.l, z.l;
