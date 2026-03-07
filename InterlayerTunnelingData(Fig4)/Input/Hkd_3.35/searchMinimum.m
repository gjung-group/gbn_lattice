%fun = @(x)getHkd(x, 0.48, 0,5, 0.36);
%x0 = -2.7;
%V0_pi = fminsearch(fun,x0);
%V0_pi

a = 2.4389777651302801;
r0 = 0.184*a;
V0_pi = -2.7; % not used here for Kaxiras minimum search
%DFT = 0.36;

element = "BBp";
realOrImag = "imag";
cz0 = 3.35;


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

%lb = [0.8];
%ub = [1.2];

% x is the V0_sigma to be optimized, which here is just the prefactor to
% the Kaxiras hoppings
N = 15;

%dvecNew = zeros(length(DFTVec));
%for ddd = 1:length(DFTVec)
%    dvecNew(ddd) = dvec(ddd,:).';
%end
%dvec
%dvecNew = num2cell(dvec,1)
%dvecNew

%fun = @(x,dvec)getHkdCF([x(1), element, realOrImag, N], dvec)
%x = lsqcurvefit(fun,1,dvec,DFTVec, lb, ub)

%fun = @(x,dvec)getHkdCF_KoshinoGlobal(x(1),x(2), dvec)
fun = @(x,dvec)getHkdCF_Koshino(x, dvec,element,realOrImag,cz0)
%fun = @(x,dvec)getHkdCF_Kaxiras(x, dvec)
x = lsqcurvefit(fun,1.0,dvec,DFTVec)
%fminsearch(@(x)getHkd(V0_pi,x, r0, DFTVec, dvec, element, realOrImag, N),1)

%fminsearchbnd(@(x)getHkd(V0_pi,x, r0, DFTVec, dvec, element, realOrImag,N),[1],lb,ub)
%fmincon(@(x)getHkd(V0_pi,x, r0, DFTVec, dvec, element, realOrImag),1.0,A, b, lb,ub)
%element
