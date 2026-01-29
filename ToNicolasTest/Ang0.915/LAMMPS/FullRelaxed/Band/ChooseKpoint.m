function kvec = ChooseKpoint(K,G,M,nsum1,Hsize,temp1)

KM = K - M;

n1 = nsum1(1);
n2 = nsum1(2);
n3 = nsum1(3);
nsum = nsum1(4);

%K vector, kvec(1,:) = kx, kvec(2,:) = ky, kvec(3,:) = add them into a line
kvec = zeros(3,nsum);

emod = zeros(nsum,Hsize);

for jk = 1:n1
kvec(1,jk+1) = M(1) * (jk/ n1) ;
kvec(2,jk+1) = M(2) * (jk/ n1) ;
kvec(3,jk+1) = kvec(3,jk) + sqrt( (M(1) / n1)^2 + (M(2)/n1)^2 );
end


for jk = 1:n2
kvec(1,jk + n1+1) = M(1) + KM(1) * (jk/ n2) ;
kvec(2,jk + n1+1) = M(2) + KM(2) * (jk/ n2) ;
kvec(3,jk + n1+1) = kvec(3,jk + n1) + sqrt( (KM(1) / n2)^2 + (KM(2)/n2)^2 );
end


for jk = 1:n3
kvec(1,jk + n1 + n2+1) = K(1) - K(1) * (jk/ n3) ;
kvec(2,jk + n1 + n2+1) = K(2) - K(2) * (jk/ n3) ;
kvec(3,jk + n1 + n2+1) = kvec(3,jk + n1 + n2) + sqrt( (K(1) / n3)^2 + (K(2)/n3)^2 ) ;
end

kvec = kvec*2*pi/temp1;
end