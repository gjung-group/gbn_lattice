function [elem1]=tmayouParams(distv,cz, V0_pi, V0_sigma, r0)

%  We start with in-plane hopping terms
%  - t(d) = V1*( 1 - (dvec*ez/d).^2 ) + V2*( dvec*ez /d).^2
% 
%V0_pi      =  -2.7    ;    % eV
%V0_sigma   =   0.48   ;    % eV
a    =   2.4389777651302801         ;    % AA
%del0 =   0.184*a      ;    % AA
a0   =   a./sqrt(3)   ;    % AA
del0 =   3.35         ;    % AA
%r0   =   0.184*a      ;    % AA 

%dz = 0             % For in-plane hopping terms.
dx = distv(1)*a ;
dy = distv(2)*a ;
dz = cz*a ; 

   dis = sqrt( dx.^2 + dy.^2 + dz.^2 )  ;

   v_pi     =  V0_pi    * exp( -( dis -    a0 )  / r0 )   ;
   v_sigma  =  V0_sigma * exp( -( dis -  del0 )  / r0 )   ;
   

%if dis < 3
%   Distance dependent hopping term by Mayou
    elem1 =    ( v_pi.*(1 - (dz./ dis).^2  ) ...
              +   v_sigma.*(dz ./ dis  ).^2 )  ;
          
%          hopping = v_pi * (1 - (dz / d) ** 2) + v_sigma * (dz / d) ** 2
%else
%    elem1 = 0.0 ;
    
end

