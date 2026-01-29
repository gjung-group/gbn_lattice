clear all
close all
element = "ABp";
realOrImag = "real";

dist = 3.5;

distS = string(num2str(dist,3))

if element == "AAp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Re_AAp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Im_AAp.dat');    
    end
elseif element == "ABp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Re_ABp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Im_ABp.dat');    
    end 
elseif element == "BAp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Re_BAp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Im_BAp.dat');    
    end 
elseif element == "BBp"
    if realOrImag == "real"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Re_BBp.dat');
    elseif realOrImag == "imag"
         A = dlmread('/Users/nihao/Dropbox/realspace_tdbg_trilayer/Srivani/Hkd_Tunneling_GG/New_dxdy_' + distS + '/Im_BBp.dat');    
    end 
end

dvec = A(:, [1,2]);
zvec = dist * ones(length(dvec),1);
DFTVec = A(:,3);

xvec = [dvec zvec];




dvec = A(:, [1,2]);
DFTVec = A(:,3);

hkd = zeros(length(DFTVec));


V0_pi = -2.7;


aG = 2.4389777651302801;
%aG = 2.46;
r0 = 0.184*aG;



V0_sigma = 1.1293; % Mayou
V0_sigma = 0.8963; % Koshino 3.1
V0_sigma = 1.2044; % Koshino 3.5
N = 15;

V0_sigma =0.7745              ;
r0 = 0.8309 ;



V0_sigma =0.2596                ;
r0 = 0.2244   ;



V0_sigma =0.5592                   ;
r0 = 0.5488    ;




% r0/2





V0_sigma = 0.2640               ; % 3.2
r0 = 0.184*aG/2.0;

V0_sigma = 0.3030               ; % 3.25
r0 = 0.184*aG/2.0;

V0_sigma = 0.3477               ; % 3.3
r0 = 0.184*aG/2.0;

V0_sigma = 0.3989               ; % 3.35
r0 = 0.184*aG/2.0;

V0_sigma = 0.4572              ; % 3.4
r0 = 0.184*aG/2.0;

V0_sigma = 0.5236            ; % 3.45
r0 = 0.184*aG/2.0;

V0_sigma = 0.5994            ; % 3.5
r0 = 0.184*aG/2.0;

V0_sigma = 0.2301                 ; % 3.15
r0 = 0.184*aG/2.0;

V0_sigma = 0.2005                ; % 3.1
r0 = 0.184*aG/2.0;




% new r0/2

V0_sigma = 0.5994                ; % 3.5
r0 = 0.184*aG/2.0;

V0_sigma = 0.2005                ; % 3.1
r0 = 0.184*aG/2.0;


% new r0*0.75





V0_sigma = 0.5432                ; % 3.5
r0 = 0.184*aG*0.75;

V0_sigma = 0.5078                ; % 3.45
r0 = 0.184*aG*0.75;

V0_sigma = 0.4745                ; % 3.4
r0 = 0.184*aG*0.75;

V0_sigma = 0.4431                ; % 3.35
r0 = 0.184*aG*0.75;

V0_sigma = 0.4134                ; % 3.3
r0 = 0.184*aG*0.75;

V0_sigma = 0.3856                ; % 3.25
r0 = 0.184*aG*0.75;

V0_sigma = 0.3596                ; % 3.2
r0 = 0.184*aG*0.75;

V0_sigma = 0.3355                ; % 3.15
r0 = 0.184*aG*0.75;

V0_sigma = 0.3130                ; % 3.1
r0 = 0.184*aG*0.75;


% fit also with V0_pi

%V0_pi = 1
V0_sigma = 1                ; % 3.1
r0 = 0.184*aG*0.5;

% fit also with V0_pi, r = r0

%V0_pi =  -165.0979
V0_sigma =   0.0460             ; 
r0 = 0.184*aG*1.0;

%V0_pi =     -1.0004
V0_sigma =   0.4475              ;
r0 = 0.184*aG*1.0;

% r0 0.8899, 0.9241, 0.9597, 0.9969, 1.0354, 1.0752, 1.1156, 1.1567, 1.1988












V0_sigma = 1.1567    * 0.48           ; % 3.45
r0 = 0.184*aG;

V0_sigma = 1.1156  * 0.48             ; % 3.4
r0 = 0.184*aG;

V0_sigma = 1.0752   * 0.48              ; % 3.35
r0 = 0.184*aG;

V0_sigma = 1.0354    * 0.48              ; % 3.3
r0 = 0.184*aG;

V0_sigma = 0.9969  * 0.48               ; % 3.25
r0 = 0.184*aG;

V0_sigma = 0.9597    * 0.48               ; % 3.2
r0 = 0.184*aG;

V0_sigma = 0.9241     * 0.48              ; % 3.15
r0 = 0.184*aG;














% AA
V0_sigma = 0.8911    * 0.48             ; % 3.1
r0 = 0.184*aG;

% AB
V0_sigma = 0.8899    * 0.48             ; % 3.1
r0 = 0.184*aG;

V0_sigma = 1.1988     * 0.48         ; % 3.5
r0 = 0.184*aG;


for ii=1:length(DFTVec)
    hkdval(ii) = getHkdForMap_KoshinoGlobal(V0_pi, V0_sigma, r0, DFTVec(ii), dvec(ii,:), element, realOrImag, N, zvec(ii));
end

scatter(dvec(:,1), dvec(:,2), 100, DFTVec,"filled");
title("DFT")
colorbar
figure()
scatter(dvec(:,1), dvec(:,2), 100, hkdval,"filled");
title("Fit")
colorbar
figure()
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

