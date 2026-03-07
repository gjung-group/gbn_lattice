function j=coordinate2number(m,N)
% Transfroms the coordinate on the hexagonal lattice to a line number in H

j = (m(1)+N)*(2*N+1) + (m(2)+N+1);

% to account for the sublattice
j=j*2-1;

if j<=0
    'error'
end