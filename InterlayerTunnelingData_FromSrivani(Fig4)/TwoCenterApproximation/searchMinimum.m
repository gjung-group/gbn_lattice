%fun = @(x)getHkd(x, 0.48, 0,5, 0.36);
%x0 = -2.7;
%V0_pi = fminsearch(fun,x0);
%V0_pi

a = 2.4389777651302801;
r0 = 0.184*a;
V0_pi = -2.7; % not used here for Kaxiras minimum search

element = "BAp";
realOrImag = "real";


dist = "3.1"


if element == "AAp"
    if realOrImag == "real"
         A = dlmread('Re_AAp.dat');
    elseif realOrImag == "imag"
         A = dlmread('Im_AAp.dat');    
    end
elseif element == "ABp"
    if realOrImag == "real"
         A = dlmread('Re_ABp.dat');
    elseif realOrImag == "imag"
         A = dlmread('Im_ABp.dat');    
    end 
elseif element == "BAp"
    if realOrImag == "real"
         A = dlmread('Re_BAp.dat');
    elseif realOrImag == "imag"
         A = dlmread('Im_BAp.dat');    
    end 
elseif element == "BBp"
    if realOrImag == "real"
         A = dlmread('Re_BBp.dat');
    elseif realOrImag == "imag"
         A = dlmread('Im_BBp.dat');    
    end 
end



dvec = A(:, [1,2])
DFTVec = A(:,3);

size(dvec)
size(DFTVec)

N = 15;

fun = @(x,dvec)getHkdCF_Koshino(x, dvec,element,realOrImag)
x = lsqcurvefit(fun,1.0,dvec,DFTVec)

