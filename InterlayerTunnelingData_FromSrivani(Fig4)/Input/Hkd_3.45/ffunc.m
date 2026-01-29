function [elem]=ffunc(kx,ky,tbp)


    ph1 = exp(1j*ky/sqrt(3))*...
      ( 1 + 2*exp( -1j*3*ky/(2*sqrt(3)) )*cos(kx/2) );                %
          
    ph3 = exp( -1j*2*ky/sqrt(3)) + 2*exp(1j*ky/sqrt(3))*cos(kx);   %
     
    ph4 = 2*exp(1j*5*ky/(2*sqrt(3)))*cos(kx/2)...
            + 2*exp(-1j*ky/(2*sqrt(3)))*cos(3*kx/2)...
            + 2*exp(-1j*2*ky/sqrt(3))*cos(kx) ;                       %
     
    ph7 = 2*exp(1j*ky/sqrt(3))*cos(2*kx) + ...
         2*exp(1j*ky*5/(2*sqrt(3)))*cos(3*kx/2) + ...
         2*exp(-1j*ky*7/(2*sqrt(3)))*cos(kx/2);                       %

    ph8 = exp(1j*ky*4/sqrt(3)) + ...
        2*cos(2*kx)*exp(-1j*ky*7/(2*sqrt(3)));  %
        
    ph9 =  2*exp(1j*4*ky/sqrt(3))*cos(kx) + ...
              2*exp(-1j*ky/(2*sqrt(3)))*cos(5*kx/2) + ...
              2*exp(-1j*ky*7/(2*sqrt(3)))*cos(3*kx/2);                %        
        
    ph11 = exp(-1j*5*ky/sqrt(3)) + 2*exp(1j*5*ky/(2*sqrt(3)))*cos(5*kx/2) ;  %
    
    ph13 = 2*cos(2*kx)*exp(1j*ky*4/sqrt(3)) + ...
        2*cos(3*kx)*exp(1j*ky/sqrt(3)) + ...
        2*cos(kx)*exp(-1j*ky*5/sqrt(3)) ;  %
    
    ph14 = 2*cos(kx/2)*exp(1j*ky*11/(2*sqrt(3))) + ...
        2*cos(3*kx)*exp(-1j*ky*2/sqrt(3)) + ...
        2*cos(5*kx/2)*exp(-1j*7*ky/(2*sqrt(3))) ;                  %
        
    ph16 = 2*cos(kx*7/2)*exp(-1j*ky/(2*sqrt(3))) + ...
        2*cos(kx*3/2)*exp(1j*ky*11/(2*sqrt(3))) + ...
        2*cos(kx*2)*exp(-1j*5*ky/sqrt(3)) ;                        %
    
   
    phs = zeros(10,1);
    phs(1) = ph1;
    phs(2) = ph3;
    phs(3) = ph4;
    phs(4) = ph7;
    phs(5) = ph8;
    phs(6) = ph9;
    phs(7) = ph11;
    phs(8) = ph13;
    phs(9) = ph14;
    phs(10) = ph16;
    
%kx
%ky

elem = tbp'*phs  ;
