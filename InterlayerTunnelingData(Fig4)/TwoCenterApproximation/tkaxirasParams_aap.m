function [elem1]=tkaxirasParams(distv3,theta12,theta21)

% a = 2.4389777651302801;

distv2 = distv3(1:2) ; 

elem1 =    V0fun(distv2) + V3fun(distv2).*(cos(3*theta12) + cos(3*theta21)) + V6fun(distv2).*(cos(6*theta12) + cos(6*theta21)) ;
       
end






function v0 = V0fun(distv)

lambda0 = 0.38 ;
xi0 = 1.961;
kappa0 = -1.884;

rbar        = norm(distv) ; %/2.4389777651302801  ;

v0          = lambda0*exp(-xi0.*rbar.^2)*cos(kappa0*rbar)  ;

       a0 =      0.3976 ;
       b0 =     -0.6037 ;
       c0 =       1.343 ;
       d0 =       1.946 ;
v0= a0.*exp(-(((rbar)-b0)/c0).^4) .* cos(d0.*(rbar));

end
  


function v3 = V3fun(distv)

lambda3 = 8.183e-05 ;
xi3 = 0.1231 ;
x3 = -2.109 ;

rbar        =  norm(distv); %/2.4389777651302801 ;


v3          =  lambda3*rbar.^2 .* exp(-xi3*(rbar-x3).^2)  ;

       a3 =  -2.705e-05 ;
       b3 =      0.8312 ;
       c3 =      0.6609 ;
v3= a3.*(rbar).^2.*exp(-b3.*((rbar)-c3).^2);

end 



function v6 = V6fun(distv)
       k6 =      0.9929  ;
       k6b =        0.81 ;
       l6 =       0.057  ;
       l6b =    -0.07907 ;
       x6 =       1.424 ;
       x6b =      0.7337;
       xi6 =      0.7239 ;
       xi6b =      0.8221 ;

rbar = norm(distv); %/2.4389777651302801  ;

v6 = ( l6.*(rbar).*exp(-xi6.*((rbar)-x6).^2).*sin(k6.*(rbar))+l6b.*(rbar).^2.*exp(-xi6b.*((rbar)-x6b).^2).*sin(k6b.*(rbar)) );

       a6 =    -0.02057 ;
       b6 =       4.899 ;
       c6 =       -1.33 ;
v6 = a6.*exp(-b6.*((rbar)+c6).^2);




end


  









