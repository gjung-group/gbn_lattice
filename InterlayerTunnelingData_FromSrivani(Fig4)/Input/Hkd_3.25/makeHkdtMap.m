clear all
close all
element = "BBp";
realOrImag = "real";
cz0 = 3.25;

dist = "3.5";

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

dvec = A(:, [1,2]);
DFTVec = A(:,3);

hkd = zeros(length(DFTVec));

aG = 2.4389777651302801;
V0_pi = -2.7;

%V0_sigma = 0.4473; %AAp real
%V0_sigma = 0.4609; %AAp imag
%V0_sigma = 0.0024; %ABp real

r0 = 0.184*aG;



% including V0 and V3, sublattice dependent using AB data and AA data (both up to
% V12)

% New 3.1
V0_sigma = 1.2169; % AAp 1.2184
V0_sigma = 0.8275; % ABp 0.8317
V0_sigma = 1.1909; % BAp 1.1958
V0_sigma = 0.8197; % BBp 0.8237

N = 15;


for ii=1:length(DFTVec)
    hkdval(ii) = getHkdForMap_Koshino(V0_pi, V0_sigma, r0, DFTVec(ii), dvec(ii,:), element, realOrImag, N, cz0);
end

%figure("Position",[0,0,3,1])
subplot(1,3,1);
scatter(dvec(:,1), dvec(:,2), 100, DFTVec,"filled");
title("DFT")
colorbar
subplot(1,3,2);
scatter(dvec(:,1), dvec(:,2), 100, hkdval,"filled");
title("Fit")
colorbar
subplot(1,3,3);
diff = DFTVec-hkdval';

writematrix(dvec(:,1),"xvec.dat",'Delimiter','tab')
writematrix(dvec(:,2),"yvec.dat",'Delimiter','tab')
writematrix(diff,element + "diff.dat",'Delimiter','tab')
writematrix(DFTVec,element + "DFT.dat",'Delimiter','tab')
writematrix(hkdval',element + "TB.dat",'Delimiter','tab')


scatter(dvec(:,1), dvec(:,2), 100, diff,"filled");
colorbar
title("Diff")
max(abs(diff))

filename = strcat(element+'_'+realOrImag+'_3.1.png');
saveas(gcf,filename);
