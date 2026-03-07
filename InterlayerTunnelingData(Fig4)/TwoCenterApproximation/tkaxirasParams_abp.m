function [elem1]=tkaxirasParams(distv3,theta12,theta21)

% a = 2.4389777651302801;

distv2 = distv3(1:2) ; 

elem1 =    V0fun(distv2) + V3fun(distv2).*(cos(3*theta12) + cos(3*theta21)) + V6fun(distv2).*(cos(6*theta12) + cos(6*theta21)) ;
       
end






function v0 = V0fun(distv)

lambda0 = 0.3352 ;
xi0 = 1.842;
kappa0 = -1.759;

rbar        = norm(distv) ; %/2.4389777651302801  ;

v0          = lambda0*exp(-xi0.*rbar.^2)*cos(kappa0*rbar)  ;

       a0 =      0.3557 ;
       b0 =     -0.6759 ;
       c0 =       1.429 ;
       d0 =       1.812 ;
v0= a0.*exp(-(((rbar)-b0)/c0).^4) .* cos(d0.*(rbar));

end
  


function v3 = V3fun(distv)

lambda3 = 0.1422 ;
xi3 = 3.943 ;
x3 = 0.5482 ;

rbar        =  norm(distv); %/2.4389777651302801 ;

v3          =  -(lambda3*rbar.^2 .* exp(-xi3*(rbar-x3).^2))   ;

       a3 =      0.1422 ;
       b3 =       3.943 ;
       c3 =      0.5482 ;
v3= -( a3.*(rbar).^2.*exp(-b3.*((rbar)-c3).^2));

end 



function v6 = V6fun(distv)
       k6 =    0.005459 ;
       k6b =       1.505 ;
       l6 =       1.986 ;
       l6b =    -0.01527;
       x6 =      0.4105 ;
       x6b =      0.7825 ;
       xi6 =       1.021 ;
       xi6b =        1.24 ;

rbar = norm(distv); %/2.4389777651302801  ;

v6 = ( l6.*(rbar).*exp(-xi6.*((rbar)-x6).^2).*sin(k6.*(rbar))+l6b.*(rbar).^2.*exp(-xi6b.*((rbar)-x6b).^2).*sin(k6b.*(rbar)) );

       a6 =   -0.009565 ;
       b6 =       6.382 ;
       c6 =      -1.256 ;
v6 = a6.*exp(-b6.*((rbar)+c6).^2);


end


  









