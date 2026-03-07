function hkdval=getHkdForMap_Koshino(V0_pi, V0_sigma, r0, DFTVec, dvecM, element, realOrImag, N, cz0)
% Band structure of bilayer graphene.
% 1d, separate file for convenience. rep= 3. 
% Adapted from band_graphene_1d.m
% to produce the band structure of the bilayer structure.
% All the relevant hopping parameters will be included accordingly.
% --- --- --- --- --- --- --- --- --- --- --- ---
% --- --- --- --- --- --- --- --- --- --- --- ---


%clear all

% Definition of constants. Can be changed according to the needs.
clc
hart = 27.21138505;
num  = 5  ;   % Number of k-points.
ndim = 4  ;     % We have four dimensions in a bilayer graphene.
diminn = 1  ;
mass   = 0  ;   % in eV
xll    =  0.034  ;       % Region of Bzone represented.
xll    =  10  ;       % Region of Bzone represented.

zlim   =  4.15*2000  ;    % Just to put the z axis scale alright
%hold on
%line([0.66 ; 0.674],[0 ; 0])   %Reference horizontal line
%line([0.66666666 ; 0.6666666],[-0.04 ; 0.04])

bohr = 0.52917721092 ;

% --- --- --- --- ---- --- ----- --------
%dvec   =  [ 0 ; 1/sqrt(3) ]   ;
cz     =  cz0 / 2.4389777651302801 ; 



% -- Define arrays and set them to zero --
fhops = zeros(10,1);
ghops = zeros(12,1);

fab  = zeros(10,1);
faap = fab;
fabp = fab;

gaa  = zeros(12,1);
gbb  = gaa;
gbap = gaa;


%For simplified model
ftab  = fab;  
ftaap = fab;
ftabp = fab;

gtaa  = gaa;  
gtbb  = gaa;
gtbap = gaa;


% For n=2 model;
fn2ab  = fab;  
fn2aap = fab;
fn2abp = fab;

gn2aa  = gaa;  
gn2bb  = gaa;
gn2bap = gaa;


% -----------------------------------------

load fdata30.dat
load gdata30.dat

fab(1:10,1)  = fdata30(1:10,1);
faap(1:10,1) = fdata30(1:10,2);
fabp(1:10,1) = fdata30(1:10,3);

gaa(1:12,1)  = gdata30(1:12,1);
gbb(1:12,1)  = gdata30(1:12,2);
gbap(1:12,1) = gdata30(1:12,3);

% Origin correction
gaa(1,1) = gaa(1,1) + 0.01445 ;
gbb(1,1) = gbb(1,1) + 0.01445 ;



% -- Gammas for the effective model. --
gamab  = -2.61;
gamaap = 0.138;
gamabp = 0.283;
%gamaa  = -0.005; %gambb  = 0.01; 
gamaa = 0;
gambb = 0.015;
gambap = 0.361;


% For simplified model
ftab(1)  = gamab  ;  
ftaap(1) = gamaap ;
ftabp(1) = gamabp ;

gtaa(1)  = gamaa ;  
gtbb(1)  = gambb ;
gtbap(1) = gambap ;



% For n=2 model.
fn2ab(1)  = -3.010   ;   fn2ab(2)  = -0.1984 ;  
fn2aap(1) =  0.09244 ;   fn2aap(2) = -0.02299 ;
fn2abp(1) =  0.1391  ;   fn2abp(2) = -0.07211 ;

gn2aa(1)  = 0.4295 ;  gn2aa(2)  =  0.2235;  gn2aa(3)  = 0.04016 ; gn2aa(4)  = gn2aa(3) ;  
gn2bb(1)  = 0.4506 ;  gn2bb(2)  =  0.2260;  gn2bb(3)  = 0.0404 ; gn2bb(4)  = gn2bb(3) ;
gn2bap(1) = 0.3310 ;  gn2bap(2) = -0.0102;  gn2bap(3) = 0.0001 ; gn2bap(4) = gn2bap(3) ;



% -- -- -- -- -- -- -- -- -- -- -- -- --



%%

origcorrec =  -0.318060000000000 ; % all contributions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Arrays for the k-points.
%
n3 = 20000;
n1 = round( n3*sqrt(3) / 2 );
n2 = 10000;

nsum = n1 + n2 + n3 + 1 ;
K = [  2/3    0 ];
G = [   0     0 ];
M = [  1/2   1/(2*sqrt(3)) ];
KM = K - M;


% Define kvecs  ----------------------------------------------------
kvec = zeros(3,nsum);

for jk = 1:n1
kvec(1,jk+1) = M(1) * (jk/ n1) ;
kvec(2,jk+1) = M(2) * (jk/ n1) ;
kvec(3,jk+1) = kvec(3,jk) + sqrt( (M(1) / n1)^2 + (M(2)/n1)^2 );
end


for jk = 1:n2
kvec(1,jk + n1+1) = M(1) + KM(1) * (jk/ n2) ;
kvec(2,jk + n1+1) = M(2) + KM(2) * (jk/ n2) ;
kvec(3,jk + n1+1) = kvec(3,jk + n1) + sqrt( (KM(1) / n2)^2 + (KM(2)/n2)^2 );
end


for jk = 1:n3
kvec(1,jk + n1 + n2+1) = K(1) - K(1) * (jk/ n3) ;
kvec(2,jk + n1 + n2+1) = K(2) - K(2) * (jk/ n3) ;
kvec(3,jk + n1 + n2+1) = kvec(3,jk + n1 + n2) + sqrt( (K(1) / n3)^2 + (K(2)/n3)^2 ) ;
end

kvec = kvec*2*pi;



% ------------------------------------------------------------------




%%%% do not modify the following%%%%%%%%%%%%%%%%%%
num1 = num;      % dimension of array
kd = 4*pi/3 ;    % Dirac point, subtract


% Choose. 1 for 1d, 2 for 2d. 3 for 1d symmetry points plot.

rep = 3 ; %jeil

%kvecs for different plot
if rep==1
kvec = zeros(3,nsum);
kintv = kd/100;
ksp = 2*kintv/nsum;
for jk=1:nsum
   kvec(1,jk) =  -kintv + ksp*jk + kd ; 
   kvec(2,:)  =  0 ;
   kvec(3,jk) =  kvec(1,jk);
end
end






%This is for contour plot
if rep == 2
 kxx = linspace(-xll,xll,num) ;
 kyy = linspace(-xll,xll,num) ;
[qx,qy]   =  meshgrid(kxx,kyy) ;
end


%This is for linear plot
if rep == 1
   kxx = linspace(-xll,xll,nsum) ; 
   kyy = linspace(0,0,1) ;
  [qx,qy]   =  meshgrid(kxx,kyy) ;
end
  


%% ----------------------------------------------

%N    = 2  ;
L    = 2*(2*N+1)^2 ;
z    =  ones(L,1);

% Define the list of lattice sites to be used in our calculations

% Reset data
mn   = zeros(2, L )  ;
vecs = zeros(2, L )  ;
inShell = zeros(1,L) ;
shell = 4 ; % Cutoff in the disk range


a1   = [ 1 ; 0 ] ;
a2   = [ 0.5 ; sqrt(3)./2 ] ;
di   = [0; 0] ;
df   = [0; 0] ;
dfia = [0; 0] ;
dfib = [0; 0] ;

%G1 =  2*pi *[ 1  ;  1/sqrt(3) ]  ;
%G2 =  2*pi *[ 0  ;  2/sqrt(3) ]  ;
%G  =  2*pi *2/sqrt(3) ;

shiftv =   [ 0 ;  1./sqrt(3) ];

nco = 0  ;

for j = 1:2:L-1
    
    nco = nco + 1  ;
    m   = number2coordinate(j,N) ;
    av = a1.*m(1) + a2.*m(2)     ;
    avec(:,j)    = av(:)         ;
    avec(:,j+1)  = av(:)  + shiftv(:)       ;
    
    norma1 = norm(av)  ;
    norma2 = norm(av)  ;
    normvec1(nco) = norma1  ;
    normvec2(nco) = norma2  ;


% We may use this cutoff disk
    if  norma1 < shell
        inShell(j)   =  1  ;
    end
    
    if  norma2 < shell
        inShell(j+1) =  1  ;
    end
    
    
end

% This is not really needed
indInShell = find(inShell==1);
avecc = [avec(1,indInShell);avec(2,indInShell)];
zz = z(indInShell);

%figure
 %scatter3(avec(1,:),avec(2,:),z(:),'o') ;
%
% ---------------------- ---------------------- --------------------
%












%%
%&&&&&& don't modify below &&&&&&&&&&&&&&&&&&&&&
if rep==3
emod = zeros(nsum,ndim);
else
Ene = zeros( length(kxx), length(kyy), ndim ) ;
evector = zeros(ndim,ndim) ;
pseudo  = zeros(length(kxx), length(kyy)) ;
pseudox = zeros(length(kxx), length(kyy)) ;
pseudoy = zeros(length(kxx), length(kyy)) ;
end

evals    = zeros(ndim,ndim);






% jeil, modify loops if needed
% for ii=1:length(kyy)
%    ky = kyy(ii) ;   
    
%    for jj=1:length(kxx) 
%        kx = kxx(jj) + kd;
        
   ii = 1;


   
% Uncomment this for 1d representation and comment loop
%        for ii = 1:nsum   
%            kx = kvec(1,ii)  ;
%            ky = kvec(2,ii)  ;
            
hbapMinbapDFTSum = 0;
for ddd = 1:length(DFTVec)
    DFT = DFTVec(ddd);
    dvec = dvecM(ddd,:).';
    %dvectemp   =  [ 0 ; 1/sqrt(3) ] 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            

%
       kx = 4*pi/3; ky = 0;   %For origcorrec calculation
       kv = [kx ; ky] ; %kvec(1:2,ii)  ;


% Full model
%[haa]   = gfunc(kx,ky,gaa);[hbb]   = gfunc(kx,ky,gbb);[hapap]  = gfunc(kx,ky,gbb);[hbpbp] = gfunc(kx,ky,gaa);[hbap]  = gfunc(kx,ky,gbap);
%[hab]   = ffunc(kx,ky,fab);[haap]  = ffunc(kx,ky,faap);[helem] = ffunc(kx,ky,fabp); habp = conj(helem)*1.0;


% n=2 model.
[haa]   = gfunc(kx,ky,gn2aa); [hbb]   = gfunc(kx,ky,gn2bb); [hapap] = gfunc(kx,ky,gn2bb); [hbpbp] = gfunc(kx,ky,gn2aa); [hbap]  = gfunc(kx,ky,gn2bap);
[hab]   = ffunc(kx,ky,fn2ab); [haap]  = ffunc(kx,ky,fn2aap); [helem] = ffunc(kx,ky,fn2abp); habp = conj(helem);



% Simple model.
%[haa]   = gfunc(kx,ky,gtaa); [hbb]   = gfunc(kx,ky,gtbb); [hapap] = gfunc(kx,ky,gtbb); [hbpbp] = gfunc(kx,ky,gtaa); [hbap]  = gfunc(kx,ky,gtbap);
%[hab]   = ffunc(kx,ky,ftab); [haap]  = ffunc(kx,ky,ftaap); [helem] = ffunc(kx,ky,ftabp); habp = conj(helem);


% Continuum model. Uses the same hopping as the simple model, only modify dispersion.
%[haa]   = gfunc(kx,ky,gtaa);[hbb]   = gfunc(kx,ky,gtbb);[hapap]  = gfunc(kx,ky,gtbb);[hbpbp] = gfunc(kx,ky,gtaa);[hbap]  = gfunc(kx,ky,gtbap);
%[hab]   = ffunccnt(kx,ky,ftab);[haap]  = ffunccnt(kx,ky,ftaap);[helem] = ffunccnt(kx,ky,ftabp); habp = conj(helem);



hbbp    = haap ; hapbp   = hab  ; 

oc = 0.01445 ; oc=0; 
haa = haa + oc ; hbb = hbb + oc ; hapap = hapap + oc ; hbpbp = hbpbp + oc ;
  

% ---- Initialize the constants ----
%%{

hbbp  = 0 ;  hapbp = 0 ;  haa   = 0 ;  hbb   = 0 ;  hapap = 0 ; hbpbp = 0 ;
hab   = 0 ;  haap  = 0 ;  habp  = 0 ;  hbap  = 0 ;

%oc = 0.01445 ; 
oc = 0 ;
% ---- ---- The diagonal elements are only constants ---- ---- ----
haa   =  oc  ;  hbb   =  oc  ;  hapap =  oc  ;  hbpbp =  oc  ;  





% ----- Calculate the matrix elements using Mayou -----
nco      =   0  ;
    
for ijk = 1:2:L - 1   %  Loops in different unit cells 
    nco = nco + 1  ;
    m   = number2coordinate(ijk,N) ;
    av  = a1.*m(1) + a2.*m(2)      ;
    avec(:,j)    = av(:)           ;
    avec(:,j+1)  = av(:)  + shiftv(:)       ;

% --- Starting point di = = (0,0). Endpoint df = d + av. dif = df - di ---    
    dif1a =  av  ;             % 0
    dif1b =  av + shiftv  ;    % +
    dif1c =  av - shiftv  ;    % -

% --- --- --- --- Interlayer hopping distances ---- ---- ---- ---- ----
    dif2a = dvec + av  ;           
    dif2b = dvec + av + shiftv  ;
    dif2c = dvec + av - shiftv  ;
    
% --- interlayer tunneling t2 --- --- AA stacking
dist2 = [dif2a;cz] ;

% --- Calculate theta12a, theta21a ---
    %u = [dif2a; 0]; v = [0 1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    u = [dif2a; 0]; v = [0 -1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    theta12a = ThetaInDegrees1*pi./180 ;
    u = [- dif2a; 0] ;  ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    theta21a = ThetaInDegrees2*pi./180 ;

%t2_kaxiras = tkaxirasParams(dist2,theta12a,theta21a) ;
%t2_kaxiras = tkaxirasParamsAASameSublattice(dist2,theta12a,theta21a) ;
t2_kaxiras = tmayou(dif2a,cz);
%t2_kaxiras = tkaxirasParams_aap(dist2,theta12a,theta21a) ;
haap  =  haap  +  t2_kaxiras .* exp( 1j*(dot(kv,dif2a) )) ;

% --- Calculate theta12b, theta21b ---
    %u = [dif2a; 0]; v = [0 -1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    u = [dif2a; 0]; v = [0 1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    theta12b = ThetaInDegrees1*pi./180 ;
    u = [- dif2a; 0] ;  ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    theta21b = ThetaInDegrees2*pi./180 ;

%t2_kaxiras = tkaxirasParams(dist2,theta12b,theta21b) ;
%t2_kaxiras = tkaxirasParamsAASameSublattice(dist2,theta12b,theta21b) ;
t2_kaxiras = tmayou(dif2a,cz);
%t2_kaxiras = tkaxirasParams_aap(dist2,theta12b,theta21b) ;
hbbp  =  hbbp  +  t2_kaxiras .* exp( 1j*(dot(kv,dif2a) )) ;


    %u = [dif2b; 0]; v = [0 -1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    u = [dif2b; 0]; v = [0 1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    theta12b = ThetaInDegrees1*pi./180 ;
    %u = [- dif2b; 0] ;  ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    %u = [- dif2b; 0] ;v = [0 1/sqrt(3) 0];   ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    u = [- dif2b; 0] ;v = [0 -1/sqrt(3) 0];   ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    theta21b = ThetaInDegrees2*pi./180 ;

%habp  =  habp  +  tkaxirasParams([dif2b;cz],theta12b,theta21b) .* exp( 1j*(dot(kv,dif2b) )) ;
%habp  =  habp  +  tkaxirasParamsABpDifferentSublattice([dif2b;cz],theta12b,theta21b) .* exp( 1j*(dot(kv,dif2b) )) ;
%habp  =  habp  +  tkaxirasParams_abp([dif2b;cz],theta12b,theta21b) .* exp( 1j*(dot(kv,dif2b) )) ;
habp  =  habp  +  tmayou(dif2b,cz) .* exp( 1j*(dot(kv,dif2b) )) ;


    %u = [dif2c; 0]; v = [0 1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    u = [dif2c; 0]; v = [0 -1/sqrt(3) 0];  ThetaInDegrees1 = atan2d(norm(cross(u,v)),dot(u,v));
    theta12a = ThetaInDegrees1*pi./180 ;
    %u = [- dif2c; 0] ;  ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    %u = [- dif2c; 0] ; v = [0 -1/sqrt(3) 0];  ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    u = [- dif2c; 0] ; v = [0 1/sqrt(3) 0];  ThetaInDegrees2 = atan2d(norm(cross(u,v)),dot(u,v));
    theta21a = ThetaInDegrees2*pi./180 ;
    
%hbap  =  hbap  +  tkaxirasParams([dif2c;cz],theta12a,theta21a) .* exp( 1j*(dot(kv,dif2c) )) ;
%hbap  =  hbap  +  tkaxirasParamsBApDifferentSublattice([dif2c;cz],theta12a,theta21a) .* exp( 1j*(dot(kv,dif2c) )) ;
%hbap  =  hbap  +  tkaxirasParams_bap([dif2c;cz],theta12a,theta21a) .* exp( 1j*(dot(kv,dif2c) )) ;
hbap  =  hbap  +  tmayou(dif2c,cz) .* exp( 1j*(dot(kv,dif2c) )) ;

% --- --- The off diagonal elements include more hopping terms --- ---
% --- intralayer ---


%t1_mayou = tmayouParams(dif1b,0,V0_pi, V0_sigma, r0) ;
% t1_mayou = tmayouParams(dif1b,0,V0_pi, V0_sigma, r0) ;
% hab   =  hab   +  t1_mayou .*exp( 1j*(dot(kv,dif1b) )) ;
% hapbp =  hapbp +  t1_mayou .*exp( 1j*(dot(kv,dif1b) )) ;
% 
% % --- interlayer --- dvec stacking
% t2_mayou = tmayouParams(dif2a,cz, V0_pi, V0_sigma, r0) ;
% haap  =  haap  +  t2_mayou .* exp( 1j*(dot(kv,dif2a) )) ;
% hbbp  =  hbbp  +  t2_mayou .* exp( 1j*(dot(kv,dif2a) )) ;
% 
% habp  =  habp  +  tmayouParams(dif2b,cz,V0_pi, V0_sigma, r0) .* exp( 1j*(dot(kv,dif2b) )) ;
% hbap  =  hbap  +  tmayouParams(dif2c,cz,V0_pi, V0_sigma, r0) .* exp( 1j*(dot(kv,dif2c) )) ;


% --- interlayer --- AB stacking
%t2_mayou = tmayou(dif2b,0) ;
%haap  =  haap  +  t2_mayou.*exp( 1j*(dot(kv,dif2b) )) ;
%hbbp  =  hbbp  +  t2_mayou.*exp( 1j*(dot(kv,dif2b) )) ;

%habp  =  habp  +  tmayou(dif2c,cz).*exp( 1j*(dot(kv,dif2c) )) ;
%hbap  =  hbap  +  tmayou(dif2a,cz).*exp( 1j*(dot(kv,dif2a) )) ;



end

% ---- ------ --------- - ------ - -- - - -- - --


%[haa,hbb,hapap,hbpbp,hab,haap,habp,hbap,hbbp,hapbp] = helemcalc(kv)
%}

haap = V0_sigma * haap;
hbbp = V0_sigma * hbbp;
habp = V0_sigma * habp;
hbap = V0_sigma * hbap;



       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 H1 = [    real(haa)          hab         haap      habp         ;   ...
           conj(hab)    real(hbb)         hbap      hbbp         ; ...
           conj(haap)  conj(hbap)   real(hapap)     hapbp        ; ...
           conj(habp)  conj(hbbp)  conj(hapbp)  real(hbpbp)    ] ;
  
if element == "AAp"
    if realOrImag == "real"
        val = real(haap);
    elseif realOrImag == "imag"
        val = imag(haap);
    end
elseif element == "ABp"
    if realOrImag == "real"
        val = real(habp);
    elseif realOrImag == "imag"
        val = imag(habp);
    end
elseif element == "BAp"
    if realOrImag == "real"
        val = real(hbap);
    elseif realOrImag == "imag"
        val = imag(hbap);
    end
elseif element == "BBp"
    if realOrImag == "real"
        val = real(hbbp);
    elseif realOrImag == "imag"
        val = imag(hbbp);
    end
end
       
hkdval = val;


end


       
%  H1 = [    real(haa)          hab   ; ...
%        conj(hab)         real(hbb)    ]
           

                         
        H = zeros(ndim) ;
        H(1:ndim,1:ndim) = H1 ; 
        
        
        
   %     if rep == 1
   %     %Ene(jj,ii,:)      =   eig(H) ;   
   %     emod(ii,:)        =   eig(H1) ;    
   %     elseif rep==3     % This is the one for 1D representation      
   %     emod(ii,:)        =   eig(H1) ;    
   %     elseif rep==2
   %     [Ene(ii,jj,:)]    =   eig(H) ;     % diagonalizing twice.
   %     [evector, evals]  =   eig(H) ;
   %     end
        
  
%    end

%end   %jeil. Need to comment this line for 1D


        
 %%       

if rep == 1
       
% dfig = figure;       
% hold on
% plot(kxx(:),Ene(:,1,ndim/2))
% plot(kxx(:),Ene(:,1,ndim/2+1))

   const = 1/(2*pi);

 %plot(kvec(3,:)*const,emod(:,ndim/2)  , kvec(3,:)*const,emod(:,ndim/2-1))
 %plot(kvec(3,:)*const,emod(:,ndim/2+1), kvec(3,:)*const,emod(:,ndim/2+2)) 
   
   %plot(kvec(3,:)*const,emod(:,ndim/2))
   %plot(kvec(3,:)*const,emod(:,ndim/2+1))
   

%   plot(kvec(3,:)*const,0)

 %hold off
 


elseif rep == 3
%const = 2.46/(2*pi) ;
%const = 1/(2*pi)    ;
kpt =    0.910683602522955;
const =    (2.32601/0.910683602522955)/(2*pi)  ;
const = 1/(2*pi);

%  dfig = figure;       
 %  hold on
%  plot(kvec(3,:)*const,emod(:,ndim/2),'*')

   %plot(kvec(3,:)*const,emod(:,ndim/2),'o',kvec(3,:)*const,emod(:,ndim/2-1),'*')
   %plot(kvec(3,:)*const,emod(:,ndim/2+1),'o',kvec(3,:)*const,emod(:,ndim/2+2),'*') 
   
  % plot(kvec(3,:)*const,emod(:,ndim/2),kvec(3,:)*const,emod(:,ndim/2-1))
  % plot(kvec(3,:)*const,emod(:,ndim/2+1),kvec(3,:)*const,emod(:,ndim/2+2)) 
  % plot(kvec(3,:)*const,emod(:,ndim/2-1))
  % plot(kvec(3,:)*const,emod(:,ndim/2))
  % plot(kvec(3,:)*const,emod(:,ndim/2+1)) 
  % plot(kvec(3,:)*const,emod(:,ndim/2+2))

%   hold off
   
%   kvx=kvec(3,:)*const;
  
   
   
% cb = interp1(kvx(1:474),emod(1:474,2),xaxis(1:274,1)) ; 
% vb = interp1(kvx(1:474),emod(1:474,1),xaxis(1:274,1)) ; 
% run wannierbands to define bandr
% plot(xaxis,cb,xaxis,bndncat) ;
% plot(xaxis,vb,xaxis,ban30(:,6)) ;
% dif3  = ban30(:,6) - cb(:) ;
% difd3 = bndncat(:) - vb(:) ;


   elseif rep == 2
       

%  Valence and conduction bands
%e1(:,:) = Ene(:,:,ndim/2+1)  ;
%e2(:,:) = Ene(:,:,ndim/2)    ;




%figg = figure
%colormap(hsv(100));
%%
%hold on
%surf(qx,qy,e1);   %jeil
%surf(qx,qy,(e1+e2));

%surf(qx,qy,e2);
%shading interp
%zlimmin = -zlim/1000;
%zlimmax =  zlim/1000;
%axis([-xll   xll   -xll   xll   2.2*zlimmin 2.2*zlimmax])    % jeil.
%pbaspect([1 1 1])

%%
%contour (kxx,kyy,e2 - origcorrec,[-0.3,-0.3])
%contour (kxx,kyy,e1 - origcorrec,[0.2,0.2])

%contour3 (kxx,kyy,e1 - oc,[0.2,0.2])


%jeil
%hold off




%{
%%
h = findobj('Type','patch');
set(h,'LineWidth',2)
camlight right;
camlight (0,-90);
lighting phong;
view(-30,0)


set(gca,'DataAspectRatio',[1 1 zlim/xll],...
'XTick',[-0.1 0 0.1],...
'YTick',[-0.1 0 0.1],...
'ZTick',...
[-0.01      0    0.01] ,'ZTickLabel','-0.01*gam0|0|0.01*gam0')
set(gca,'visible','off')
%colormap(hsv)
%}




%{
colormap(winter);
subplot(2,1,2 ,'Position',[0.318 0.1 0.4 0.4])
hold on
cc5 = surf(qx,qy,e1);
%surf(gx1,gy1,g2);

shading interp
axis([-xll xll -xll xll  zlimmin  zlimmax] ...
)
contour3 (qx,qy,e1)
hold off
 

set(cc5,'AmbientStrength',1)
h = findobj('Type','patch');
set(h,'LineWidth',2)
light('Position',[0 0 1],'Style','infinite');
lighting phong;

view(0,90)
set(gca,'DataAspectRatio',[1 1 1],...
    'YTick',[-xll 0 xll],'XTick',[-xll 0 xll], 'FontSize',14 )
colorbar('peer',gca,'FontSize',14);


%xlabel('xaxis')

%}



end












%%



%{
spc = 0.00005 ;     %0.0005; %This accuracy is just okay.
gx = -xl:spc:xl;
gy = -xl:spc:xl;


[qx,qy]   =  meshgrid(gx,gy);
ngr = size(gx,2);
g   = zeros(size(gx,2),size(gx,2));
gg   = zeros(size(gx,2),size(gx,2));
g1upp = zeros(size(gx,2),size(gx,2),4);   %four bands per spin


for ii = 1:4
F  = TriScatteredInterp(x,y,z(:,ii));   
g = F(qx,qy);
g1upp(:,:,ii) = g(:,:);
end 


g(:,:)  = g1upp(:,:,3);
gg(:,:) = g1upp(:,:,2);


subplot(2,2,2,'Position',[0.575 0.55 0.4 0.4])
%colormap hsv(100);
%colormap(hot(100));


hold on
surf(gx,gy,g);
surf(gx,gy,gg);


shading interp
axis([-xll xll -xll xll -zlim zlim])
hold on
contour3 (gx,gy,g,[0,0])
hold off


h = findobj('Type','patch');
set(h,'LineWidth',2)
camlight right;
camlight (30,-85);
lighting phong;


view(0,0)
%set(gca,'DataAspectRatio',[1 1 2])
set(gca,'DataAspectRatio',[1 1 2],'XTick',[-0.05 0 0.05],'XTickLabel',''...
,'ZTick',[-0.1    -0.05    0    0.05  0.1] ,'ZTickLabel','')



%   contourplot
subplot(2,2,4,'Position',[0.575 0.1 0.4 0.4]);
cc = surf(gx,gy,g);
shading interp
axis([-xll xll -xll xll -0.1 0.1])
hold on
%contour3 (gx,gy,g,[0 0])
contour3 (gx,gy,g)

hold off

set(cc,'AmbientStrength',1)
h = findobj('Type','patch');
set(h,'LineWidth',2)
light('Position',[0 0 1],'Style','infinite');
lighting phong;
view(0,90)
set(gca,'DataAspectRatio',[1 1 1],'YTick',[-0.05 0 0.05],'YTickLabel','')

upos = [1 1 520 500]
set(figg,'Position',upos)


%}





%%

%{
surf(kxx,kyy, Ene(:,:,ndim/2));
shading interp
hold on
view(0,90)


set(gca,'FontSize',12)
set(gca,'XTick',[-1 0  1])
set(gca,'YTick',[-1 0  1])

rotlabels

ylabel('$k_y  \quad   (\AA^{-1})$','Interpreter', 'latex');
xlabel('$k_x  \quad   (\AA^{-1})$','Interpreter', 'latex');
zlabel('$ m_n (k) \quad \quad  (\mu_B)$','Interpreter', 'latex');

%%
contour3 (qx,qy,Ene(:,:,ndim/2),16)
hold off
view(0,90)

save Ene Ene

%}


%%
% horizontal line

%{
hold on
xval1 = 0;
xval2 = 4.1;
ymin = 0; ymax = 0;
x = [xval1,xval2] ;
y = [ymin,ymax] ;
plot(x,y,'Color',[0 0 0],'Linewidth',0.7)


%xlim(axes1,[0 4.029]);

xval1 = 1.47463 ;
xval2 = 2.32601 ;
xval3 = 4.02877 ;
ymin = -20;
ymax =  15;

x = [xval1,xval1] ;
y = [ymin,ymax] ;
plot(x,y,'Color',[0 0 0],'Linewidth',0.7)
x = [xval2,xval2] ;
plot(x,y,'Color',[0 0 0],'Linewidth',0.7)

%}
end
