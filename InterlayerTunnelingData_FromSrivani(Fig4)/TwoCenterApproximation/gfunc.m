function [elem1]=gfunc(kx,ky,tbh)


    ph0 = 1;

    ph2 = 2*cos(kx) + 4*cos(ky*sqrt(3)/2)*cos(kx/2);   
         
    ph5  = exp(1j*sqrt(3)*ky)  +  2*exp(-1j*sqrt(3)*ky/2)*cos(3*kx/2)   ;
    ph5p = conj(ph5);

    ph6 = 2*cos(2*kx) + 4*cos(kx)*cos(ky*sqrt(3)) ;

    ph10 = 2*cos(2*kx)*exp(1j*sqrt(3)*ky) + ...
       2*cos(kx/2)*exp(-1j*3*sqrt(3)*ky/2) + ...
       2*cos(5*kx/2)*exp(-1j*sqrt(3)*ky/2) ;       

    ph10p = conj(ph10);
     
    ph12 = 2*cos(3*kx) + 4*cos(3*kx/2)*cos(3*ky*sqrt(3)/2) ;
    
    ph15 = exp(1j*ky*6/sqrt(3)) + 2*cos(3*kx)*exp(-1j*sqrt(3)*ky) ;
    ph15p = conj(ph15);

    
    ph17 = 2*cos(kx*7/2)*exp(1j*ky*sqrt(3)/2) + ...
           2*cos(kx)*exp(-1j*ky*2*sqrt(3)) + ...
           2*cos(kx*5/2)*exp(-1j*ky*3*sqrt(3)/2);
    
    ph17p = conj(ph17);
   
    phss = zeros(12,1);
    phss(1) = ph0;
    phss(2) = ph2;
    phss(3) = ph5;
    phss(4) = ph5p;
    phss(5) = ph6;
    phss(6) = ph10;
    phss(7) = ph10p;
    phss(8) = ph12;
    phss(9) = ph15;
    phss(10) = ph15p;
    phss(11) = ph17;
    phss(12) = ph17p;
    

    
elem1 = tbh'*phss  ;





 
    