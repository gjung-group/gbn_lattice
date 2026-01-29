%fun = @(x)getHkd(x, 0.48, 0,5, 0.36);
%x0 = -2.7;
%V0_pi = fminsearch(fun,x0);
%V0_pi

a = 2.4389777651302801;
r0 = 0.184*a*1.0;
V0_pi = -2.7; % not used here for Kaxiras minimum search
%DFT = 0.36;

element = "ABp";
realOrImag = "real";

distVec = [3.1]%, 3.15, 3.2, 3.25, 3.3, 3.35, 3.4, 3.45, 3.5];


DFTVecTot = [];
dvecTot = [];
xvecTot = [];


for jk = 1:length(distVec)
    dist = string(num2str(distVec(jk),3));
    distVec(jk)
    dist

if element == "AAp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Re_AAp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Im_AAp.dat');    
    end
elseif element == "ABp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Re_ABp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Im_ABp.dat');    
    end 
elseif element == "BAp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Re_BAp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Im_BAp.dat');    
    end 
elseif element == "BBp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Re_BBp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + dist + '/Im_BBp.dat');    
    end 
end



dvec = A(:, [1,2]);
zvec = distVec(jk) * ones(length(dvec),1);
DFTVec = A(:,3);

xvec = [dvec zvec];

DFTVecTot = [DFTVecTot; DFTVec];
xvecTot = [xvecTot; xvec];



end


lb = [0.1,-5];
ub = [10,-1];

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

size(xvecTot)
size(DFTVecTot)

mmm = 1

%fun = @(x,xvecTot)getHkdCF_KoshinoGlobal(x(1),x(2), xvecTot)
fun = @(x,xvecTot)getHkdCF_KoshinoGlobal(x(1),x(2), xvecTot)
%fun = @(x,xvecTot)getHkdCF_KoshinoGlobal(x, xvecTot)
%fun = @(x,dvec)getHkdCF_Koshino(x, dvec)
%fun = @(x,dvec)getHkdCF_Kaxiras(x, dvec)
x = lsqcurvefit(fun,[0.48,-2.7],xvecTot,DFTVecTot, lb, ub)
%fminsearch(@(x)getHkd(V0_pi,x, r0, DFTVec, dvec, element, realOrImag, N),1)

%fminsearchbnd(@(x)getHkd(V0_pi,x, r0, DFTVec, dvec, element, realOrImag,N),[1],lb,ub)
%fmincon(@(x)getHkd(V0_pi,x, r0, DFTVec, dvec, element, realOrImag),1.0,A, b, lb,ub)
%element
