% Program to plot the matrix elements 
clear all
load sweep_335.dat
sweep  =  sweep_335 ;
hart   =  27.21138505;  % 2 Ry

close all
dx = 1;
dy = sqrt(3);

qx  = linspace(0,dx,11);
qy  = linspace(0,dy,19);


e1    = zeros(max(size(sweep)),1); %( 209,1 )
e2    = e1  ;  e1a   = e1; e2a   = e1; e1b   = e1; e2b   = e1;
e1c   = e1  ;  e2c   = e1; e1d   = e1; e2d   = e1; e1e   = e1; e2e   = e1;
eaa1  = e1  ;  eaa2  = e1; ebb1  = e1; ebb2  = e1; eab1  = e1; eab2  = e1;
eba1  = e1  ;  eba2  = e1; 

e0aa1 = e1;  e0aa2 = e1; 
e0ab1 = e1;  e0ab2 = e1; 
e0ba1 = e1;  e0ba2 = e1; 
e0bb1 = e1;  e0bb2 = e1;

e1aa1p1 = e1;   e1aa1p2 = e1; 
e1ab1p1 = e1;   e1ab1p2 = e1;
e1ba1p1 = e1;   e1ba1p2 = e1; 
e1bb1p1 = e1;   e1bb1p2 = e1;

e1a1pa1p1 = e1; e1a1pa1p2 = e1;
e1a1pb1p1 = e1; e1a1pb1p2 = e1;
e1b1pa1p1 = e1; e1b1pa1p2 = e1; 
e1b1pb1p1 = e1; e1b1pb1p2 = e1;


gap = e1;

%Size of the area to map
nsize =   6 ;   nnsize = 2*nsize + 1 ;
slim  =   4 ;   %  Careful so that it doesn't clip zeros of gx, gy outside the defined domain.

% 20 Wannier functions. The first 8 are the pz orbitals.
% Here we use the corrected labels. But we are not using these.
% Dirac point hamiltonian matrix is 2* (20, 20), the prefactor two
% is for real and imaginary numbers. 

% At d = (0, 0)
% 1. B   bottom layer  ( 0, 0 , -3.35)
% 2. N   bottom layer  ( 0, a/sqrt(3) , -3.35 )
% 3. C   1st layer     ( 0, 0, 3.35 )
% 4. C   1st layer     ( 0, a/sqrt(3), 3.35 )

%{
% -------------for A and B --------------%

e0aa1(:) = sweep( :,1 ) ; % A, A
e0aa2(:) = sweep( :,2 ) ; 

e0ab1(:) = sweep( :,3 ) ; % A, B
e0ab2(:) = sweep( :,4 ) ; 

e0ba1(:) = sweep( :,21 ) ; % B, A
e0ba2(:) = sweep( :,22 ) ; 

e0bb1(:) = sweep( :,23 ) ; % B, B
e0bb2(:) = sweep( :,24 ) ; 

% -------------for interlayer terms--------------%

e1aa1p1(:) = sweep(:,5);%( :,11 ) ; % A, A'
e1aa1p2(:) = sweep(:,6);%( :,12 ) ; 

e1ab1p1(:) = sweep(:,7);%( :,13 ) ; % A, B'
e1ab1p2(:) = sweep(:,8);%( :,14 ) ; 

e1ba1p1(:) = sweep(:,25);%( :,31 ) ; % B, A'
e1ba1p2(:) = sweep(:,26);%( :,32 ) ; 

e1bb1p1(:) = sweep(:,27);%( :,33 ) ; % B, B'
e1bb1p2(:) = sweep(:,28);%( :,34 ) ; 

% -------------for A' and B'--------------%
e1a1pa1p1(:) = sweep(:,45);%( :,111 ) ; % A', A'
e1a1pa1p2(:) = sweep(:,46);%( :,112 ) ; 

e1a1pb1p1(:) = sweep(:,47);%( :,113 ) ; % A', B'   
e1a1pb1p2(:) = sweep(:,48);%( :,114 ) ; 

e1b1pa1p1(:) = sweep(:,65);%( :,131 ) ; % B', A'
e1b1pa1p2(:) = sweep(:,66);%( :,132 ) ;

e1b1pb1p1(:) = sweep(:,67);%( :,133 ) ; % B', B'
e1b1pb1p2(:) = sweep(:,68);%( :,134 ) ; 
% -------------
%}
%{
% -------------for A and B --------------%

e0aa1(:) = sweep( :,1 ) ; % A, A
e0aa2(:) = sweep( :,2 ) ; 

e0ab1(:) = sweep( :,3 ) ; % A, B
e0ab2(:) = sweep( :,4 ) ; 

e0ba1(:) = sweep( :,21 ) ; % B, A
e0ba2(:) = sweep( :,22 ) ; 

e0bb1(:) = sweep( :,23 ) ; % B, B
e0bb2(:) = sweep( :,24 ) ; 

% -------------for interlayer terms--------------%

e1aa1p1(:) = sweep(:,5);%( :,11 ) ; % A, A'
e1aa1p2(:) = sweep(:,6);%( :,12 ) ; 

e1ab1p1(:) = sweep(:,7);%( :,13 ) ; % A, B'
e1ab1p2(:) = sweep(:,8);%( :,14 ) ; 

e1ba1p1(:) = sweep(:,25);%( :,31 ) ; % B, A'
e1ba1p2(:) = sweep(:,26);%( :,32 ) ; 

e1bb1p1(:) = sweep(:,27);%( :,33 ) ; % B, B'
e1bb1p2(:) = sweep(:,28);%( :,34 ) ; 

% -------------for A' and B'--------------%

e1a1pa1p1(:) = sweep(:,45);%( :,111 ) ; % A', A'
e1a1pa1p2(:) = sweep(:,46);%( :,112 ) ; 

e1a1pb1p1(:) = sweep(:,47);%( :,113 ) ; % A', B'   
e1a1pb1p2(:) = sweep(:,48);%( :,114 ) ; 

e1b1pa1p1(:) = sweep(:,65);%( :,131 ) ; % B', A'
e1b1pa1p2(:) = sweep(:,66);%( :,132 ) ;

e1b1pb1p1(:) = sweep(:,67);%( :,133 ) ; % B', B'
e1b1pb1p2(:) = sweep(:,68);%( :,134 ) ; 
%}
% -------------for A and B --------------%

e0aa1(:) = sweep( :,1 ) ; % A, A
e0aa2(:) = sweep( :,2 ) ; 

e0ab1(:) = sweep( :,21 ) ; % A, B
e0ab2(:) = sweep( :,22 ) ; 

e0ba1(:) = sweep( :,3 ) ; % B, A
e0ba2(:) = sweep( :,4 ) ; 

e0bb1(:) = sweep( :,23 ) ; % B, B
e0bb2(:) = sweep( :,24 ) ; 

% -------------for interlayer terms--------------%

e1aa1p1(:) = sweep(:,41);%( :,11 ) ; % A, A'
e1aa1p2(:) = sweep(:,42);%( :,12 ) ; 

e1ab1p1(:) = sweep(:,61);%( :,13 ) ; % A, B'
e1ab1p2(:) = sweep(:,62);%( :,14 ) ; 

e1ba1p1(:) = sweep(:,43);%( :,31 ) ; % B, A'
e1ba1p2(:) = sweep(:,44);%( :,32 ) ; 

e1bb1p1(:) = sweep(:,63);%( :,33 ) ; % B, B'
e1bb1p2(:) = sweep(:,64);%( :,34 ) ; 

% -------------for A' and B'--------------%

e1a1pa1p1(:) = sweep(:,45);%( :,111 ) ; % A', A'
e1a1pa1p2(:) = sweep(:,46);%( :,112 ) ; 

e1a1pb1p1(:) = sweep(:,65);%( :,113 ) ; % A', B'   
e1a1pb1p2(:) = sweep(:,66);%( :,114 ) ; 

e1b1pa1p1(:) = sweep(:,65);%( :,131 ) ; % B', A'
e1b1pa1p2(:) = sweep(:,66);%( :,132 ) ;

e1b1pb1p1(:) = sweep(:,47);%( :,133 ) ; % B', B'
e1b1pb1p2(:) = sweep(:,48);%( :,134 ) ; 

% -----------------------------------------%
%% 
% kstep  = 4*pi/(3*20);

for val= 5:8

switch val
% ---------------for A and B--------------%
    case 1
        e1 = e0aa1;
        e2 = e0aa2;
        indices = 'AA';
        indiceslatex = "AA";
        diagonal = 1;
    case 2
        e1 = e0ab1;
        e2 = e0ab2;
        indices = 'AB';
        indiceslatex = "AB";
        diagonal = 0;
    case 3
        e1 = e0ba1;
        e2 = e0ba2;
        indices = 'BA';
        indiceslatex = "BA";
        diagonal = 0;
    case 4 
        e1 = e0bb1;
        e2 = e0bb2;
        indices = 'BB';
        indiceslatex = "BB";
        diagonal = 1;
%----------------------------%
% ---------------for A' and B'--------------%
    case 5
        e1 = e1aa1p1;
        e2 = e1aa1p2;
        indices = 'AAp';
        indiceslatex = "AA'";
        diagonal = 0;
        tunnelingFileNameRe = "Re_AAp.dat";
        tunnelingFileNameIm = "Im_AAp.dat";
    case 6
        e1 = e1ab1p1;
        e2 = e1ab1p2;
        indices = 'ABp';
        indiceslatex = "AB'";
        diagonal = 0;
        tunnelingFileNameRe = "Re_ABp.dat";
        tunnelingFileNameIm = "Im_ABp.dat";
    case 7
        e1 = e1ba1p1;
        e2 = e1ba1p2;
        indices = 'BAp';
        indiceslatex = "BA'";
        diagonal = 0;
        tunnelingFileNameRe = "Re_BAp.dat";
        tunnelingFileNameIm = "Im_BAp.dat";
    case 8
        e1 = e1bb1p1;
        e2 = e1bb1p2;
        indices = 'BBp';
        indiceslatex = "BB'";
        diagonal = 0;
        tunnelingFileNameRe = "Re_BBp.dat";
        tunnelingFileNameIm = "Im_BBp.dat";
    case 9
        e1 = e1a1pa1p1;
        e2 = e1a1pa1p2;
        indices = 'ApAp';
        indiceslatex = "A'A'";
        diagonal = 1;
    case 10
        e1 = e1a1pb1p1;
        e2 = e1a1pb1p2;
        indices = 'ApBp';
        indiceslatex = "A'B'";
        diagonal = 0;
          
    case 11
        e1 = e1b1pa1p1;
        e2 = e1b1pa1p2;
        indices = 'BpAp';
        indiceslatex = "B'A'";
        diagonal = 0;
               
    case 12
        e1 = e1b1pb1p1;
        e2 = e1b1pb1p2;
        indices = 'BpBp';
        indiceslatex = "B'B'";
        diagonal = 1;

end
%%

ee1  = reshape(e1,19,11)  ;
ee2  = reshape(e2,19,11)  ;

gapp     = reshape(gap,19,11) ;
%gapdifff = reshape(gapdiff,36,21) ;
%gapreff  = reshape(gapref,36,21) ;


% remove/compensate outliers

% POINT 1
%{
%outliers = [10 11; 7 11; 5 11; 22 19; 24 21];
outliers = [11 21;10 11; 7 11; 5 11;3 15;24 20;22 18];


for mmm=1:7
    
    c = outliers(mmm,2);
    r = outliers(mmm,1);
    
    diffr = 18;
    diffc = 10;
    
    if (r>18)
       diffr = -diffr; 
    end
    
    if (c>10)
       diffc = -diffc; 
    end
    
ee1(r,c) = ee1(r+diffr,c+diffc);
ee2(r,c) = ee2(r+diffr,c+diffc);

ee1a(r,c) = ee1a(r+diffr,c+diffc);
ee2a(r,c) = ee2a(r+diffr,c+diffc);

ee1b(r,c) = ee1b(r+diffr,c+diffc);
ee2b(r,c) = ee2b(r+diffr,c+diffc);

ee1c(r,c) = ee1c(r+diffr,c+diffc);
ee2c(r,c) = ee2c(r+diffr,c+diffc);

ee1d(r,c) = ee1d(r+diffr,c+diffc);
ee2d(r,c) = ee2d(r+diffr,c+diffc);

ee1e(r,c) = ee1e(r+diffr,c+diffc);
ee2e(r,c) = ee2e(r+diffr,c+diffc);

gapp(r,c) = gapp(r+diffr,c+diffc);

end
%}
size(ee1)

% edif1 = ee1 - ee1d;
% edif2 = ee2 - ee2d;
% esum1 = ee1 + ee1d;
% esum2 = ee2 + ee2d;
edif1 = ee1 ;%- ee1d;
edif2 = ee2 ;%- ee2d;
esum1 = ee1 ;%+ ee1d;
esum2 = ee2 ;%+ ee2d;

[kx,ky]   =  meshgrid(qx,qy) ;




% For higher resolution interpolation figure.
%spc = 0.01;
%gx1 = 0:spc:1 ;
%gy1 = 0:spc:sqrt(3) ;
%[qx,qy]   =  meshgrid(gx1,gy1) ;


%fig1 = figure
%surf(kx,ky,ee1);

%fig2 = figure
%surf(kx,ky,ee2);


% fig1 = figure
% surf(-kx,-ky,ee1);
% 
% fig2 = figure
% surf(-kx,-ky,ee2);


% figure
% scatter3(-kx(1,:),-ky(1,:),ee1(1,:));



lkx = size(kx) 


%%
  %ee3 = 0.5*hart*reshape(totalen,36,21);  %Energies in Rydbergs.
  %ee3 = 1000*(ee3 - ee3(1,1));
  %fig3 = figure
  %axes1 = axes('Parent',fig3,'FontSize',16,'DataAspectRatio',[1 1 20]);
  %ylim(axes1,[0 1.73]);
  %view(axes1,[-0.5 90]);
  %grid(axes1,'on');
   %hold(axes1,'all');

%surf(kx,ky,ee3,'Parent',axes1)
%surf(kx,ky,1000*(ee1 - ee1(1,1) ),'Parent',axes1)
%surf(kx,ky,(ee1 - ee1(1,1) ),'Parent',axes1)
%surf(kx,ky,( sumaa + sumbb -2*efer00  ),'Parent',axes1)
%efer00 = -1.4256;
%surf(kx,ky,(ee1 - efer00   ),'Parent',axes1)
%surf(kx,ky,(ee2   ),'Parent',axes1,'EdgeColor', 'none')
% shading interp
%surf(kx,ky,(ee2   ),'Parent',axes1,'EdgeColor', 'k','LineWidth',0.1,'facecolor','interp')
  %surf(kx,ky, ee2c ,'Parent',axes1)



%colorbar('peer',axes1,...
%   [0.7258755678653 0.107402597402597 0.03 0.815],'FontSize',16);



%%


%%

var = 1000*gapp;
%var = 1000*gapdifff ;
%var = 1000*gapreff ;
%var = 1000*edif1/2;
%var = 1000*esum1/2;

%var = 1000*ex;
var = 1000*ee2;
%var = ee1/2;

%var = 1000*esum1/2;

funct = @(x,y)  interp2(kx,ky,var,x,y);
% qz = real(funct(qx,qy));
% qz = imag(funn(qx,qy));
% qz = real(ee7);
% qz = imag(ee7);

% gap4 = figure
% 
% axes1 = axes('Parent',gap4,'FontSize',16,'DataAspectRatio',[1 1 200]);
% ylim(axes1,[0 1.73]);
% view(axes1,[-0.5 90]);
% grid(axes1,'on');
% hold(axes1,'all');
% set(gca, 'Visible','off');

%% 
edifs = figure

axes1 = axes('Parent',edifs,'FontSize',16,'DataAspectRatio',[1 1 200]);
ylim(axes1,[0 1.73]);
view(axes1,[0 90]); %view(axes1,[-0.5 90]); %2d figure
grid(axes1,'on');
hold(axes1,'all');


esum1 = esum1 ;
%rep = 1000*(esum1 - esum1(1,1));
rep = (esum1)% - esum1(1,1));

% AARe = rep(1,1);
% ABRe = rep(18/3,1);
% BARe = rep(18/3*2,1);

AARe = esum1(1,1);
ABRe = esum1(18/3,1);
BARe = esum1(18/3*2,1);


% surf(kx,ky,rep,'Parent',axes1)
surf(kx,ky,esum1,'Parent',axes1)
titlename = strcat('$\Re e(H_{',indiceslatex,'})$');
title(titlename,'Interpreter','latex')
colorbar('peer',axes1,'Position',...
    [0.717679245283019 0.106774193548387 0.020125786163522 0.815]);
%colorbar(target,axes1,[0.7258755678653 0.107402597402597 0.03 0.815],'FontSize',16);
% 
% filename = strcat('CoeffMapRe',indices,'.png');
% saveas(gcf,filename);
% 
% dlmwrite(strcat('CoeffMapReDatakx',indices,'.txt'),kx,'delimiter','\t')
% dlmwrite(strcat('CoeffMapReDataky',indices,'.txt'),ky,'delimiter','\t')
% dlmwrite(strcat('CoeffMapReDatarep',indices,'.txt'),rep,'delimiter','\t')
%% 

edifs = figure

axes1 = axes('Parent',edifs,'FontSize',16,'DataAspectRatio',[1 1 200]);
ylim(axes1,[0 1.73]);
view(axes1,[-0.5 90]); %2d figure
grid(axes1,'on');
hold(axes1,'all');


esum2 = esum2 ;
%rep = 1000*(esum1 - esum1(1,1));
rep = (esum2 )%- esum2(1,1));

% AAIm = rep(1,1);
% ABIm = rep(18/3,1);
% BAIm = rep(18/3*2,1);
AAIm = esum2 (1,1);
ABIm = esum2 (18/3,1);
BAIm = esum2 (18/3*2,1);

surf(kx,ky,esum2 ,'Parent',axes1)
titlename = strcat('$\Im m(H_{',indiceslatex,'})$');
title(titlename,'Interpreter','latex')
colorbar('peer',axes1,'Position',...
    [0.717679245283019 0.106774193548387 0.020125786163522 0.815]);

%colorbar(target)%,axes1,[0.7258755678653 0.107402597402597 0.03 0.815],'FontSize',16);

% filename = strcat('CoeffMapIm',indices,'.png');
% saveas(gcf,filename);
% 
% dlmwrite(strcat('CoeffMapImDatakx',indices,'.txt'),kx,'delimiter','\t')
% dlmwrite(strcat('CoeffMapImDataky',indices,'.txt'),ky,'delimiter','\t')
% dlmwrite(strcat('CoeffMapImDatarep',indices,'.txt'),rep,'delimiter','\t')

%%
% Remove the phase factor in the Hamiltonian
ecomp  = ee1 + 1j*ee2;
kstep  = 4*pi/(3*10)

%for jj = 1:36
for ii=1:11
    
    %jeil, need to change phase
%   ee4(:,ii) = ecomp(:,ii)/( exp(1j*(ii-1)*kstep) );
   ee4(:,ii) = ecomp(:,ii)./( exp(-1j*(ii-1)*kstep) )%/( exp(1j*(ii-1)*kstep) );

% ee4(:,ii)=ecomp(:,ii)/( exp(1j*(ii-1)*kstep)); % * exp(1j*(jj-1)*kstepy));
end
%end

%%
% {
ee5r = real(ee4);

%ee5r(ee5r < -1.0) = NaN;

A = [kx(:).'; ky(:).'; ee5r(:).'];

dlmwrite(tunnelingFileNameRe,A.')

fig4 = figure
axes1 = axes('Parent',fig4,'FontSize',16,'DataAspectRatio',[1 1 200]);
ylim(axes1,[0 1.73]);
view(axes1,[-0.5 90]); %2d figure
grid(axes1,'on');
hold(axes1,'all');
surf(kx,ky,ee5r)
titlename = strcat('$\Re e(H_{',indiceslatex,'})$');
title(titlename,'Interpreter','latex')
colorbar('peer',axes1,'Position',...
    [0.717679245283019 0.106774193548387 0.020125786163522 0.815]);
%colorbar(target,axes1,[0.7258755678653 0.107402597402597 0.03 0.815],'FontSize',16);
filename = strcat('CoeffMapRe',indices,'.png');
saveas(gcf,filename);

% dlmwrite('Re_BBp.dat',ee5r)

dlmwrite(strcat('CoeffMapReDatakx',indices,'.txt'),kx,'delimiter','\t')
dlmwrite(strcat('CoeffMapReDataky',indices,'.txt'),ky,'delimiter','\t')
dlmwrite(strcat('CoeffMapReDatarep',indices,'.txt'),rep,'delimiter','\t')
%%
ee5i = imag(ee4);

A = [kx(:).'; ky(:).'; ee5i(:).'];

dlmwrite(tunnelingFileNameIm,A.')

fig5 = figure
axes1 = axes('Parent',fig5,'FontSize',16,'DataAspectRatio',[1 1 200]);
ylim(axes1,[0 1.73]);
view(axes1,[-0.5 90]); %2d figure
grid(axes1,'on');
hold(axes1,'all');
surf(kx,ky,ee5i)
titlename = strcat('$\Im m(H_{',indiceslatex,'})$');
title(titlename,'Interpreter','latex')
colorbar('peer',axes1,'Position',...
    [0.717679245283019 0.106774193548387 0.020125786163522 0.815]);
filename = strcat('CoeffMapIm',indices,'.png');
saveas(gcf,filename);

% dlmwrite('Im_BBp.dat',ee5i)

dlmwrite(strcat('CoeffMapImDatakx',indices,'.txt'),kx,'delimiter','\t')
dlmwrite(strcat('CoeffMapImDataky',indices,'.txt'),ky,'delimiter','\t')
dlmwrite(strcat('CoeffMapImDatarep',indices,'.txt'),rep,'delimiter','\t')
%}
%% Let us find the G contributions
bohr = 0.52917721092;  %in angstrom
alat = 4.609;
a = alat*bohr;
c = 10*a;

v1 = a*[ 1  0  0 ]  ;
v2 = a*[ -1/2 sqrt(3)/2   0 ]  ;
v3 = a*[ 0  0  c/a ]  ;

% The reciprocal vectors are

%vr1 = (2* pi / a) * [1.000000  0.577350  0.000000 ]  ;
%vr2 = (2* pi / a) * [0.000000  1.154701  0.000000 ]  ;
%vr3 = (2* pi / a) * [0.000000  0.        0.100000 ]  ;



% Form arrays for extended integration zone
%%
ee6 = ee4;
ee6(:,11)=[];
ee7 = [ee6 ee4];


%ee6 = ecomp;    %This patching here is wrong
%ee6(:,21)=[];
%ee7 = [ee6 ecomp];



%%
kxp = kx ;     kyp = ky ;
kxp(:,11)=[] ;   kyp(:,11)=[] ;  
kxadd = kx + 1 ;
kxp = [kxp kxadd] ;   kyp = [kyp ky] ;   


% --- --- The recipe below works as well --- ---
%kxpp = kxp(:); kypp = kyp(:);
%ee8 = ee7(:);
%F = TriScatteredInterp(kxpp,kypp,ee8);
%qz = F(kxp,kyp);
% --- --- --- --- --- ---
ee10 = zeros(19,21);
ee10(:,:) = conj(ee7(:,:));
%%
funn = @(x,y)  interp2(kxp,kyp,ee7,x,y,'cubic');
%funn = @(x,y)  tpaps(kxp,kyp,ee7);
funcon =  @(x,y)  interp2(kxp,kyp,ee10,x,y);

%%

qz   = real(funn(kxp,kyp));
qz   = imag(funn(kxp,kyp));
qz = real(ee7);
qz = imag(ee7);
figure
surf(kxp,kyp,qz)
% title('interpolation')

%%


vr1   =   (2* pi ) * [1.000000  1/sqrt(3) ];
vr2   =   (2* pi ) * [0.000000  2/sqrt(3) ];

gxsp = 2*pi ;
gysp = 2*pi*1.154701 ;

Gmat  =   size(2);
n1    =   -nsize:nsize;
n2    =   -nsize:nsize;

hg  = zeros(nnsize,nnsize);
hgr = zeros(nnsize,nnsize);
hgi = zeros(nnsize,nnsize);
gxc = zeros(nnsize,nnsize);
gyc = zeros(nnsize,nnsize);

scx = zeros(nnsize*nnsize,1);
scy = zeros(nnsize*nnsize,1);
scr = zeros(nnsize*nnsize,1);
sci = zeros(nnsize*nnsize,1);


%%
% {

nlen = 2*slim+1;
datos = zeros(nlen,nlen,4);
datos = 1e9;

%%  -- Erase after use ---
  sfact  = @(x,y,jj) ...
        exp(-1j.*jj.*G1.*y) + ...
      2.*exp(1j.*jj.*G1.*y.*0.5).*cos(0.5.*sqrt(3).*jj.*G1.*x) ;
  
  
  % --- General real function ---
  ffun1 = @(x,y,phi) ...
      2.*real( exp(1j*phi).*sfact(x,y,1) ) ;
  
  % --- General real function ---
  ffun2 = @(x,y,phi) ...
      2.*real( exp(1j*phi).*sfact(x,y,2) ) ;
  
  
  gfun =  @(x,y) ...
      2.*cos(G2.*x) + 4.*cos(y.*sqrt(3).*G2./2).*cos(x.*G2./2) ;
  
  
%  Phi0 = @(x,y,C1,phi1) C0p + C1.*ffun1(x,y,phi1) + C2.*ffun2(x,y,phi2) + C2p.*gfun(x,y);
  Phi0 = @(x,y,Cvar,phivar)   Cvar.*ffun1(x,y,phivar)  ;

  
  % --- To define the partial derivatives of Phi0 ---
  G1 = 4.*pi/sqrt(3);
  sfactx  = @(x,y,jj) ...
      -jj.*sqrt(3).*G1.*exp(1j.*jj.*G1.*y./2 ) .*sin(jj.*sqrt(3).*G1.*x./2);
  
  
  sfactxx  = @(x,y,jj) ...
      (-jj.*jj.*G1.*G1.*3./2 ) .*exp(1j.*jj.*G1.*y./2 ) .*cos(jj.*sqrt(3).*G1.*x./2);
  
  
  sfacty  = @(x,y,jj) ...
     (1j.*jj.*G1 ) .* ( - exp(-1j.*jj.*G1.*y ) + ...
      exp(1j.*jj.*G1.*y./2 ) .* cos(jj.*sqrt(3).*G1.*x./2) ) ;
  
  
  sfactyy  = @(x,y,jj) ...
     -(jj.*jj.*G1.*G1 ) .* ( ...
      exp(-1j.*jj.*G1.*y) + ...
      0.5.*exp(1j.*jj.*G1.*y./2 ) .* cos(jj.*sqrt(3).*G1.*x./2) ) ;
  

  sfactxy  = @(x,y,jj) ...
   ( -1j.*sqrt(3).*G1.*G1.*jj.*jj./2  ) .*exp(1j.*jj.*G1.*y./2 ) .*sin(jj.*sqrt(3).*G1.*x./2) ;


    ffun1x = @(x,y,phi) ...
      2.*real( exp(1j*phi).*sfactx(x,y,1) ) ;
  
    Phi0x = @(x,y,CC,phii)  CC.*ffun1x(x,y,phii)  ;

    
  
    ffun1xx = @(x,y,phi) ...
      2.*real( exp(1j*phi).*sfactxx(x,y,1) ) ;
  
    Phi0xx = @(x,y,CC,phii)  CC.*ffun1xx(x,y,phii)  ;

  
  
  
    ffun1y = @(x,y,phi) ...
      2.*real( exp(1j*phi).*sfacty(x,y,1) ) ; 
      
    Phi0y = @(x,y,CC,phii)  CC.*ffun1y(x,y,phii)  ;

  
cons = 0.01134;
phi = 20.*pi/180;
%phi=0;
funn  = @(x,y) Phi0y(-x,-y,cons,-phi) + 1j.*Phi0x(-x,-y,cons,-phi)

    
    
habx = @(x,y,c,phi) 2.*c.*cos(sqrt(3).*G1.*x./2) ...
    .*( cos(G1.*y./2 - phi) + sin(G1.*y./2 - phi - pi./6 )) ...
    + 2.*c.*sin(G1.*y + phi - pi./6);

haby = @(x,y,c,phi) 2.*c.*sin(sqrt(3).*G1.*x./2) ...
    .*( cos(G1.*y./2 - phi) - sin(G1.*y./2 - phi - pi./6 )) ;


%%

funn;

nco = 0;
gmin = 0;

a = 1;
A0 = 1*sqrt(3)/2*a^2;

for ii=1:nnsize   %Loop in G vectors along the y direction
    for jj = 1:nnsize
%        for ii=7:7   %Loop in G vectors along the y direction
%    for jj = 6:6
        
        nco = nco + 1;
        
    Gx  =  vr1(1)*n1(ii) + vr2(1)*n2(jj)  ;   % (2* pi) * 1.000000  ;
    Gy  =  vr1(2)*n1(ii) + vr2(2)*n2(jj)  ;   % (2* pi) * 0.577350  ;
     

         
    gxc(ii,jj) =  Gx;
    gyc(ii,jj) =  Gy;
    


        %jeil,  to find this spot.
    %phase = exp(-1j*Gy/(sqrt(3)));  %Add phase for vertically displaced vectors.
    %phase = exp(-1j * (Gx*
    %aaa  =  integra(funn,Gx,Gy);  %* phase ;
    %funn = @(x,y)  interp2(kxp,kyp,ee7,x,y);
    funnG = @(x,y) exp(1j * (Gx*x + Gy*y));
    funnWithG = @(x,y) funn(x,y) .* funnG(x,y);
    %funnWithGpaps = @(x,y) tpaps(x,y,funnWithG);
    %aaa = integral2(funnWithG,0,a,0,a*sqrt(3)/2);
    aaa = quad2d(funnWithG,0,a,0,a*sqrt(3)/2); % * phase;
    %aaa = quad2d(funnWithG,0,Gx,0,Gy);
    %aaa = integral2(funn,0,Gx,0,Gy);
%   [hg(ii,jj)]  =  integra(funn,Gx,Gy)* phase ;
    aaa = aaa/A0;




    hgr(ii,jj)   =  real(aaa) ; 
    hgi(ii,jj)   =  imag(aaa) ; 
    hg(ii,jj) = hgr(ii,jj) + 1j*hgi(ii,jj);  
    
    scx(nco) = Gx;
    scy(nco) = Gy;
    scr(nco) = hgr(ii,jj);
    sci(nco) = hgi(ii,jj);
    
    
    % Store arrays for 1d-plots.
    grounx = round(Gx/(2*pi)) ;
        gy = (Gy/(2*pi) ) ;

    if mod(grounx,2)
   %disp('odd')
    grouny =  round((Gy + 2*pi/sqrt(3))/(2*2*pi/sqrt(3)) );
    
   else
   %disp('even')
      
   grouny = round( sqrt(3)*Gy/(4*pi) );
    end 

    % Calculate gmins separately
    gmin = min(grouny,gmin);
    
%%{    
    if         (grounx >= -slim) && (grounx <= slim) ...
            && (grouny >= -slim) && (grouny <= slim)
    datos(slim+1+grounx,slim+1+grouny,1) = grounx;
    datos(slim+1+grounx,slim+1+grouny,2) = gy;
    datos(slim+1+grounx,slim+1+grouny,3) = scr(nco);
    datos(slim+1+grounx,slim+1+grouny,4) = sci(nco);
    end   %Close if
%}
    
    end
end



%%

% plot3(gxc,gyc,hgr,'o')
% plot3(gxc,gyc,hgi,'o')

%%{

 gxcn =   (datos(:,:,1)) ;
 gycn =   (datos(:,:,2)) ;
 hgrn =   (datos(:,:,3)) ;
 hgin =   (datos(:,:,4)) ;

 
gxca = reshape(gxcn,1,[]);
gyca = reshape(gycn,1,[]);
hgra = reshape(hgrn,1,[]);
hgia = reshape(hgin,1,[]);
%}

%gxca = reshape(gxc,1,[])/(2*pi);
%gyca = reshape(gyc,1,[])/(2*pi);
%hgra = reshape(hgr,1,[]);
%hgia = reshape(hgi,1,[]);



%%
figure1 = figure;
axes1 = axes('Parent',figure1,...
'XTick',[-4 -2  0  2  4],...    
'YTick',[-4 -2  0  2  4],...
'DataAspectRatio',[1 1 0.0004],...
'PlotBoxAspectRatio',[19 16.5 250],...
'FontSize',20);


%'PlotBoxAspectRatio',[2 4 1],
xlim(axes1,[-3.3 3.3]);  ylim(axes1,[-3.3 3.3]);
%xlim(axes1,[-3.3 3.3]);  ylim(axes1,[-3.3 3.3]);

% set zaxis limits
%zmin = -0.001;
%zmax =  0.006;
%zlim(axes1,[zmin zmax])
%caxis([zmin, zmax])
% 


view(axes1,[-0.5 90]);
grid(axes1,'on');
hold(axes1,'all');


scatter3(gxca(:),gyca(:),hgra(:),200,hgra(:),'filled')
%scatter3(gxca(:),gyca(:),hgia(:),200,hgia(:),'filled')

% Create colorbar
colorbar%('peer',axes1,...
    %[0.9 0.12 0.04 0.8],...
    %'FontSize',20);


titlename = strcat('$\Re e(H_{',indiceslatex,'})$');
title(titlename,'Interpreter','latex')

filename = strcat('MapReH',indices,'.png');
saveas(gcf,filename);
%%

%%
figure1 = figure;
axes1 = axes('Parent',figure1,...
'XTick',[-4 -2  0  2  4],...    
'YTick',[-4 -2  0  2  4],...
'DataAspectRatio',[1 1 0.0004],...
'PlotBoxAspectRatio',[19 16.5 250],...
'FontSize',20);


%'PlotBoxAspectRatio',[2 4 1],
xlim(axes1,[-3.3 3.3]);  ylim(axes1,[-3.3 3.3]);
%xlim(axes1,[-3.3 3.3]);  ylim(axes1,[-3.3 3.3]);

% set zaxis limits
%zmin = -0.001;
%zmax =  0.006;
%zlim(axes1,[zmin zmax])
%caxis([zmin, zmax])
% 


view(axes1,[-0.5 90]);
grid(axes1,'on');
hold(axes1,'all');


%scatter3(gxca(:),gyca(:),hgra(:),200,hgra(:),'filled')
scatter3(gxca(:),gyca(:),hgia(:),200,hgia(:),'filled')

% Create colorbar
colorbar%('peer',axes1,...
    %[0.9 0.12 0.04 0.8],...
    %'FontSize',20);



titlename = strcat('$\Im m(H_{',indiceslatex,'})$');
title(titlename,'Interpreter','latex')

filename = strcat('MapImH',indices,'.png');
saveas(gcf,filename);
%%

% Create colorbar
%colorbar('peer',axes1,...
%    [0.9 0.12 0.04 0.8],...
%    'FontSize',20);

%set(axes1,'XGrid','on','YGrid','off')

%hgra = abs(hgra);
hgralog = log10(hgra);
%hgralog = log10(hgia);

%scatter3(gxca(:),gyca(:),hgralog(:),200,hgralog(:),'filled');

%{
set(axes1, 'ActivePositionProperty', 'OuterPosition')

%%
set(figure1,'Units','points')
set(figure1,'PaperUnits','points')
size = get(figure1,'Position');
size = size(3:4);
set(figure1,'PaperSize',size)
set(figure1,'PaperPosition',[0,0,size(1),size(2)])

%set(figure1, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
%set(figure1, 'PaperSize', [5 5]);
saveas(figure1,'test.pdf');

%}

%%
%{
linfig = figure;
hold off

plot (datos(slim-2,:,2),datos(slim-2,:,3),'-o')
hold on

plot (datos(slim-1,:,2),datos(slim-1,:,3),'-*')
plot (datos(slim,:,2),  datos(slim,:,3),'-x')
plot (datos(slim+1,:,2),datos(slim+1,:,3),'-s')
plot (datos(slim+2,:,2),datos(slim+2,:,3),'-d')
plot (datos(slim+3,:,2),datos(slim+3,:,3),'-c')
%}

%%
logfig = figure;
datosl(:,:) = log10(datos(:,:,3));
axes1 = axes('Parent',logfig,'PlotBoxAspectRatio',[2 2 1],'FontSize',20);
hold(axes1,'all');

xlim(axes1,[-6 6]);  ylim(axes1,[-6 2]);


%hold off
%plot (datos(slim-2,:,2),datosl(slim-2,:),'-o')
hold on

plot (datos(slim-1,:,2),datosl(slim-1,:),...
        'v',...
    'MarkerFaceColor',[0 0.498039215803146 0],...
    'MarkerEdgeColor',[0 0.498039215803146 0],...
    'MarkerSize',10,...
    'LineWidth',2,'DisplayName','G_x=-2');

%
plot (datos(slim,:,2)  ,datosl(slim,:),...
        '^',...
    'MarkerFaceColor',[0.749019622802734 0 0.749019622802734],...
        'MarkerEdgeColor',[0.749019622802734 0 0.749019622802734],...
    'MarkerSize',12,...
    'Color',[0.749019622802734 0 0.749019622802734],...
    'DisplayName','G_x=-1');
  

%
plot (datos(slim+1,:,2),datosl(slim+1,:),...
    'o',...
    'MarkerFaceColor',[0 0 0],...
    'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',12,...
    'Color',[0 0 0],...
    'DisplayName','G_x=0');

plot (datos(slim+2,:,2),datosl(slim+2,:),...
    'square',...
'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0],...
    'MarkerSize',12,...
    'Color',[1 0 0],...
    'DisplayName','G_x=1');

plot (datos(slim+3,:,2),datosl(slim+3,:),...
        'diamond',...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1],...
    'MarkerSize',12,...
    'DisplayName','G_x=2');

legend(axes1,'show');

%plot (datos(slim+3,:,2),datosl(slim+3,:),'-c')



%%
nonlogfig = figure;
datosl(:,:) = datos(:,:,3);
axes1 = axes('Parent',nonlogfig,'PlotBoxAspectRatio',[2 2 1],'FontSize',20);
hold(axes1,'all');

xlim(axes1,[-6 6]);  %ylim(axes1,[-0.14 0.4]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.012 0.018]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.002 0.002]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.0008 0.0002]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.0002 0.0004]);

%xlim(axes1,[-6 6]);  ylim(axes1,[-0.016 0.024]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.03 0.024]);


%hold off
%plot (datos(slim-2,:,2),datosl(slim-2,:),'-o')
hold on

plot (datos(slim-1,:,2),datosl(slim-1,:),...
        'v',...
    'MarkerFaceColor',[0 0.498039215803146 0],...
    'MarkerEdgeColor',[0 0.498039215803146 0],...
    'MarkerSize',10,...
    'LineWidth',2,'DisplayName','G_x=-2');

plot (datos(slim,:,2)  ,datosl(slim,:),...
        'MarkerFaceColor',[0.749019622802734 0 0.749019622802734],...
    'MarkerSize',12,...
    'Marker','^',...
    'LineStyle','none',...
    'Color',[0.749019622802734 0 0.749019622802734],...
    'DisplayName','G_x=-1');
    
plot (datos(slim+1,:,2),datosl(slim+1,:),...
    'MarkerFaceColor',[0 0 0],...
    'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',12,...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0],...
    'DisplayName','G_x=0');
 
plot (datos(slim+2,:,2),datosl(slim+2,:),...
'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0],...
    'MarkerSize',12,...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[1 0 0],...
    'DisplayName','G_x=1');

plot (datos(slim+3,:,2),datosl(slim+3,:),...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1],...
    'MarkerSize',12,...
    'Marker','diamond',...
    'LineStyle','none',...
    'DisplayName','G_x=2');

legend(axes1,'show');

filename = strcat('ReH',indices,'.png');
saveas(gcf,filename);


%%
nonlogfig = figure;
datosl(:,:) = datos(:,:,4); % Imaginary part
axes1 = axes('Parent',nonlogfig,'PlotBoxAspectRatio',[2 2 1],'FontSize',20);
hold(axes1,'all');

xlim(axes1,[-6 6]);  %ylim(axes1,[-0.14 0.4]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.012 0.018]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.002 0.002]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.0008 0.0002]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.0002 0.0004]);

%xlim(axes1,[-6 6]);  ylim(axes1,[-0.016 0.024]);
%xlim(axes1,[-6 6]);  ylim(axes1,[-0.03 0.024]);


%hold off
%plot (datos(slim-2,:,2),datosl(slim-2,:),'-o')
hold on

plot (datos(slim-1,:,2),datosl(slim-1,:),...
        'v',...
    'MarkerFaceColor',[0 0.498039215803146 0],...
    'MarkerEdgeColor',[0 0.498039215803146 0],...
    'MarkerSize',10,...
    'LineWidth',2,'DisplayName','G_x=-2');

plot (datos(slim,:,2)  ,datosl(slim,:),...
        'MarkerFaceColor',[0.749019622802734 0 0.749019622802734],...
    'MarkerSize',12,...
    'Marker','^',...
    'LineStyle','none',...
    'Color',[0.749019622802734 0 0.749019622802734],...
    'DisplayName','G_x=-1');
    
plot (datos(slim+1,:,2),datosl(slim+1,:),...
    'MarkerFaceColor',[0 0 0],...
    'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',12,...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0],...
    'DisplayName','G_x=0');

plot (datos(slim+2,:,2),datosl(slim+2,:),...
'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0],...
    'MarkerSize',12,...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[1 0 0],...
    'DisplayName','G_x=1');

plot (datos(slim+3,:,2),datosl(slim+3,:),...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1],...
    'MarkerSize',12,...
    'Marker','diamond',...
    'LineStyle','none',...
    'DisplayName','G_x=2');

legend(axes1,'show');

filename = strcat('ImH',indices,'.png');
saveas(gcf,filename);

%plot (datos(slim+3,:,2),datosl(slim+3,:),'-c')


%%
% List values

hg(7,8);
hg(6,8);
hg(6,7);
hg(7,6);
hg(8,6);
hg(8,7);

%%
hga78 = abs(hg(7,8))
hga68 = abs(hg(6,8))
hga67 = abs(hg(6,7))
hga76 = abs(hg(7,6))
hga86 = abs(hg(8,6))
hga87 = abs(hg(8,7))

% USE POLAR FORM: z = r*exp(i*theta)
% r = abs(z)
% theta = arg(z)

 deg = 180/pi;
% 
phi78 = angle(hg(7,8))*deg;
phi68 = angle(hg(6,8))*deg;
phi67 = angle(hg(6,7))*deg;
phi76 = angle(hg(7,6))*deg;
phi86 = angle(hg(8,6))*deg;
phi87 = angle(hg(8,7))*deg;

%a = [abs(];
%fprintf('%d\n',round(a));


% gxc78 = gxc(7,8)
% gyc78 = gyc(7,8)
% gxc68 = gxc(6,8)
% gyc68 = gyc(6,8)
% gxc67 = gxc(6,7)
% gyc67 = gyc(6,7)
% gxc76 = gxc(7,6)
% gyc76 = gyc(7,6)
% gxc86 = gxc(8,6)
% gyc86 = gyc(8,6)
% gxc87 = gxc(8,7)
% gyc87 = gyc(8,7)


if (diagonal)
indices
Cii0Re = (AARe+ABRe+BARe)/3.0
Cii = hga78
phiii = phi86

fid = fopen(strcat(indices,'variables.txt'),'wt');
fprintf(fid, '%s\n%s\n%s\n%s', num2str(Cii0Re), num2str(Cii), num2str(phiii));
%fclose(fid);
else
    "hohoho"
indices
Cii = hga78
phiii = phi78
%phiii = -phi67 + pi/3
%phiii = -phi86 - pi/3

fid = fopen(strcat(indices,'variables.txt'),'wt');
fprintf(fid, '%s\n%s\n%s\n%s', num2str(Cii), num2str(phiii));
%fclose(fid);
end

%variables = strcat(indices, '   ', num2str(Cii0), '    ' , num2str(Cii),'    ',num2str(phiii));
%save('coefficients.txt', indices ,'-append')
%a = [abs(];
%fprintf('%d\n',round(a));
%   close all
end