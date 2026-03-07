function [elem1]=tmayouGlobal(distv,cz,V0_sigma,V0_pi,r0)

%  We start with in-plane hopping terms
%  - t(d) = V1*( 1 - (dvec*ez/d).^2 ) + V2*( dvec*ez /d).^2
% 
V0_pi      =  -2.7    ;    % eV
%V0_sigma   =   0.48   ;    % eV
%V0_sigma   =   0.36   ;    % eV
%a    =   2.456         ;    % AA
a    =   2.4389777651302801         ;    % AA
del0 =   0.184*a      ;    % AA
a0   =   a./sqrt(3)   ;    % AA
del0 =   3.35         ;    % AA
%r0   =   0.184*a      ;    % AA 
%r0   =   0.1*a      ;    % AA 

   %a_cc = 1.418;
   %a_cc = 1.42;
   a_cc = 2.4389777651302801/sqrt(3.);
   c0 = 3.349 ;
   V0_pi = -2.7 ;
   %V0_sigma = 0.48  ;

   q_sigma = c0 * 2.218  ;
   q_pi = a_cc * 2.218 ;

   lc = 0.265;
   rc = 6.14;


%dz = 0             % For in-plane hopping terms.
dx = distv(1)*a ;
dy = distv(2)*a ;
dz = cz*a ; 

   dis = sqrt( dx.^2 + dy.^2 + dz.^2 )  ;
   
      Fc = 1.0/(1.0+exp((dis-rc)/lc));
   
   Koshino = true;
   
   if (Koshino)

   v_pi     =  V0_pi    * exp( -( dis -    a0 )  / r0 )   ;
   v_sigma  =  V0_sigma * exp( -( dis -  del0 )  / r0 )   ;

   else

   v_pi = V0_pi * exp(q_pi * (1.0 - dis / a_cc))  * Fc;
   v_sigma = V0_sigma * exp(q_sigma * (1.0 - dis / c0))  * Fc;

   end
    %hopping = v_pi * (1 - (dz / d) ** 2) + v_sigma * (dz / d) ** 2
   

%if dis < 3
%   Distance dependent hopping term by Mayou
    elem1 =    ( v_pi.*(1 - (dz./ dis).^2  ) ...
              +   v_sigma.*(dz ./ dis  ).^2 )  ;
          
%          hopping = v_pi * (1 - (dz / d) ** 2) + v_sigma * (dz / d) ** 2
%else
%    elem1 = 0.0 ;
    
end

