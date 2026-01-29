function m = number2coordinate(j,N)
% change the number corresponding to the line in H to the coordinate on the hexagonal lattice

% get rid of the sublattice 
j = (j+1)/2;

z = rem(j,2*N+1);
if z==0
    z=2*N+1;
end

my = z-N-1;

mx = (j-z)/(2*N+1)-N;

m = [mx ; my];

if abs(mx)>N | abs(my)>N
    'error'
end