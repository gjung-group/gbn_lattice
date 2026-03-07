clear all
close all
element = "BAp";
realOrImag = "real";

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
V0_sigma = 2.8311; % AAp
V0_sigma = 1.9549; % ABp
V0_sigma = 2.7762; % BAp
V0_sigma = 1.9343; % BBp

% New 3.2
V0_sigma = 2.4381; % AAp
V0_sigma = 1.6643; % ABp
V0_sigma = 2.3868; % BAp
V0_sigma = 1.6477; % BBp

% New 3.3
V0_sigma = 2.1019; % AAp
V0_sigma = 1.4234; % ABp
V0_sigma = 2.0547; % BAp
V0_sigma = 1.4138; % BBp

% New 3.4
V0_sigma = 1.8083; % AAp
V0_sigma = 1.2069; % ABp
V0_sigma = 1.7654; % BAp
V0_sigma = 1.2010; % BBp

% New 3.5
V0_sigma = 1.5520; % AAp
V0_sigma = 1.0128; % ABp
V0_sigma = 1.5115; % BAp
V0_sigma = 1.0123; % BBp

% New 3.15
V0_sigma = 2.6267; % AAp
V0_sigma = 1.8029; % ABp
V0_sigma = 2.5733; % BAp
V0_sigma = 1.7847; % BBp

% New 3.25
V0_sigma = 2.2641; % AAp
V0_sigma = 1.5390; % ABp
V0_sigma = 2.2149; % BAp
V0_sigma = 1.5252; % BBp

% New 3.35
V0_sigma = 1.3425; % AAp
V0_sigma = 0.9024; % ABp
V0_sigma = 1.3111; % BAp
V0_sigma = 0.8980; % BBp

V0_sigma = 1.3425; % AAp
V0_sigma = 0.9024; % ABp
V0_sigma = 1.3182; % BAp
%V0_sigma = 0.9028; % BBp

N = 15;


for ii=1:length(DFTVec)
    hkdval(ii) = getHkdForMap_Koshino(V0_pi, V0_sigma, r0, DFTVec(ii), dvec(ii,:), element, realOrImag, N);
end

%figure("Position",[0,0,3,1])
subplot(1,3,1);
scatter(dvec(:,1), dvec(:,2), 500, DFTVec,"filled");
title("DFT")
colorbar
subplot(1,3,2);
scatter(dvec(:,1), dvec(:,2), 500, hkdval,"filled");
title("Fit")
colorbar
subplot(1,3,3);
diff = DFTVec-hkdval';

%writematrix(dvec(:,1),"xvec.dat",'Delimiter','tab')
%writematrix(dvec(:,2),"yvec.dat",'Delimiter','tab')
%writematrix(diff,element + "diff.dat",'Delimiter','tab')
%writematrix(DFTVec,element + "DFT.dat",'Delimiter','tab')
%writematrix(hkdval',element + "TB.dat",'Delimiter','tab')


scatter(dvec(:,1), dvec(:,2), 100, diff,"filled");
colorbar
title("Diff")
max(abs(diff))

filename = strcat(element+'_'+realOrImag+'_3.35.png');
saveas(gcf,filename);
