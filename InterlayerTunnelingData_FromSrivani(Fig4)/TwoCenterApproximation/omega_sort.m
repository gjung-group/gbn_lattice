clear
clc

load sweep_335.dat; 
sweep = sweep_335(1,:);


% p = 1 ;
% n = 3 ;

s = 0;

for ii = 1:4
    for jj = 1:4
       s = s+1;
         p = jj; n = ii;
         
r_i = [ ((2*n-1)+20*(p-1)) ,((2*n)+20*(p-1)) ];

real =r_i(1);
img = r_i(2);
 

for i = 1:min(size(sweep))    
    wr(i) = sweep(i,real);
    wi(i) = sweep(i,img);
    Omega = mean(wr);

end

% Data(s,:) = [p,n , wr,wi,r_i] ;
Data(s,:) = [n ,p, wr,wi,r_i] ;

    end
end
disp('GBN :')
Data
