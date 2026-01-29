clear all
global OnsiteC1 OnsiteC2 OnsiteB OnsiteN aG aBN theta phi eps eps2 CAB phiAB CAB_BN phiAB_BN

[value,Name] = textread('Input.in','%f%s');

layer2 = value(2);
layer1 = value(3);

aG = value(4);
aBN = value(5);

theta = value(6);
phi = value(7);

%% Set Parameters
Flag1 = 'ReadXYZ';
% layer2 = 53.35;
% layer1 = 50.00;

%layer2 = 19.175;
%layer1 = 15.825 ;

%layer2 = 53.35;
%layer1 = 50.00;

% Global Parameters
OnsiteC1 = -0.39969;
OnsiteC2 = -0.42011;
OnsiteB = 2.3222;
OnsiteN = -1.7795;

% OnsiteC1 = 0.4914-1.0390;
% OnsiteC2 = 0.4914-1.0390;
% OnsiteB = 0.1648+(2.2037+1.9972)/2;
% OnsiteN = -3.8678+(2.2037+1.9972)/2;


%aG = 2.4602;
%aBN = 2.505;

%eps = 1/(55*2.4602);
eps = aG/aBN-1;
eps2 = aBN/aG-1;
%theta = 0.0;

CAB = 1.987/1000;
phiAB = 3.5*pi/180;
CAB_BN = 4.418/1000;
phiAB_BN = 26.10*pi/180;

%% Read position From Input file.
[Cell,pos,posc] = BuildStructurev2(Flag1,layer1,layer2);

%figure;
%Visualize Position
Totnum = size(pos);
Totnum = Totnum(1);
for j = -1:1
    for k = -1:1
        for i = 1:Totnum
            if pos(i,3) == layer1 
                if pos(i,4) ~= 2
                    fprintf('Layer1 index mistke\n')
                end
                tempposx = pos(i,1)+Cell(1,1)*k+Cell(2,1)*j;
                tempposy = pos(i,2)+Cell(1,2)*k+Cell(2,2)*j;
%                plot3(tempposx,tempposy,pos(i,3),'or'); hold on
            elseif pos(i,3) == layer2                
                if pos(i,4) ~= 1
                    fprintf('Layer2 index mistke\n')
                end
                tempposx = pos(i,1)+Cell(1,1)*k+Cell(2,1)*j;
                tempposy = pos(i,2)+Cell(1,2)*k+Cell(2,2)*j;
%                plot3(tempposx,tempposy,pos(i,3),'ob'); hold on
            end
        end
    end
end
%plot3([0.0,Cell(1,1)],[0.0,Cell(1,2)],[0.0,Cell(1,3)],'-k'); hold on
%plot3([0.0,Cell(2,1)],[0.0,Cell(2,2)],[0.0,Cell(2,3)],'-k'); hold on
%plot3([Cell(1,1),Cell(1,1)+Cell(2,1)],[Cell(1,2),Cell(1,2)+Cell(2,2)],[0.0,0.0],'-k'); hold on
%plot3([Cell(2,1),Cell(2,1)+Cell(1,1)],[Cell(2,2),Cell(2,2)+Cell(1,2)],[0.0,0.0],'-k'); hold on

%posc = pos;
temp1 = sqrt(Cell(1,1)*Cell(1,1)+Cell(1,2)*Cell(1,2));
temp2 = sqrt(Cell(2,1)*Cell(2,1)+Cell(2,2)*Cell(2,2));
if temp1 - temp2 > 0.1
    fprintf('a1 and a2 are not same length, might need check the configuration')
end
cut = 24.0;
Hsize = Totnum; % Size of Hamiltonian

%% Define K path
K = [   2/3  ;   0 ];
G = [   0  ;   0 ];
M = [  1/2 ;  1/ (2*sqrt(3))];
KM = K - M;

n3 = 50;
n1 = round( n3*sqrt(3) / 2 );
n2 = 25;
nsum = n1 + n2 + n3 + 1 ;
n = [n1,n2,n3,nsum];

kvec = ChooseKpoint(K,G,M,n,Hsize,temp1);
%kvec = ChooseKpoint(K,K,K,n,Hsize,temp1);


%% Diagnolization the Hamiltonian
for i = 1:nsum
    tic
    sprintf('%2.2f%%', i/nsum*100)
    kx = kvec(1,i);
    ky = kvec(2,i);
    Ham = Hamilton(kx,ky,pos,posc,Cell,Hsize,cut);
    E = eig(Ham);
    emod(i,:) = E;
    toc
end
plot_dat = [kvec(3,:)',emod(:,:)];
save plot_dis_moire_0406.dat plot_dat -ascii

kx = 0;
ky = 0;
tic
Ham = Hamilton(kx,ky,pos,posc,Cell,Hsize,cut);
toc
onsite = []
for i = 1:length(Ham)
    temp = [pos(i,1),pos(i,2),pos(i,3),pos(i,4),pos(i,5),pos(i,6),Ham(i,i)];
    onsite = [onsite;temp];
end
toc
save generate.e onsite -ascii

%plot_AA_DFT = load('GBN_AAstack_DFT_bands.dat');
%plot(plot_AA_DFT(:,1)*kvec(3,length(kvec))/plot_AA_DFT(length(plot_AA_DFT),1),plot_AA_DFT(:,2),'.r');hold on
%
%plot_AA_DFT = load('GBN_ABstack_DFT_bands.dat');
%plot(plot_AA_DFT(:,1)*kvec(3,length(kvec))/plot_AA_DFT(length(plot_AA_DFT),1),plot_AA_DFT(:,2)+0.7460,'.b');hold on
%
%plot_AA_DFT = load('bands.dat.gnu');
%plot(plot_AA_DFT(:,1)*kvec(3,length(kvec))/plot_AA_DFT(length(plot_AA_DFT),1),plot_AA_DFT(:,2)+0.6962+2.53563+0.3884,'.r');hold on

size1 = size(plot_dat);
Hsize = size1(2)-1;

for i = 1:Hsize
    if i == Hsize/2 || i == Hsize/2+1
        plot(plot_dat(:,1),plot_dat(:,i+1),'r');hold on
    elseif i < Hsize/2+10 && i > Hsize/2-10
        plot(plot_dat(:,1),plot_dat(:,i+1),'b');hold on
    end
end

VBandMax = max(plot_dat(:,Hsize/2+1));
CBandMin = min(plot_dat(:,Hsize/2+1+1));
Pgap = (CBandMin-VBandMax)*1000

VBandMax = max(plot_dat(:,Hsize/2-2+1));
CBandMin = min(plot_dat(:,Hsize/2-1+1));
Sgap = (CBandMin-VBandMax)*1000

clear kvec Ham E emod 

K = [   2/3  ;   0 ];
G = [   0  ;   0 ];
M = [  1/2 ;  1/ (2*sqrt(3))];
KM = K - M;

n3 = 50;
n1 = round( n3*sqrt(3) / 2 );
n2 = 25;
nsum = n1 + n2 + n3 + 1 ;
n = [n1,n2,n3,nsum];

kvec = ChooseKpoint(K,G,M,n,Hsize,temp1);
%kvec = ChooseKpoint(K,K,K,n,Hsize,temp1);

for i = 69
    tic
    sprintf('%2.2f%%', i/nsum*100)
    kx = kvec(1,i);
    ky = kvec(2,i);
    Ham = Hamilton(kx,ky,pos,posc,Cell,Hsize,cut);
    [Wave,E] = eig(Ham);
%     emod(i,:) = E;
%     ewave(i,:) = Wave;
    toc
end
size(Wave)
size(E)
% CBandMin = min(plot_dat(:,Hsize/2-1+1));
% Sgap = (CBandMin-VBandMax)*1000
% 
%plot_wave = Wave;
for i = 1:Hsize
    for j = 1:Hsize
        Wave_abs_square(i,j) = abs(Wave(i,j))^2;
    end
end
plot_wave = Wave_abs_square;
save plot_wave_K.dat plot_wave -ascii

plot_dat = diag(E);
save plot_Ene.dat plot_dat -ascii

for i = 1
    tic
    sprintf('%2.2f%%', i/nsum*100)
    kx = kvec(1,i);
    ky = kvec(2,i);
    Ham = Hamilton(kx,ky,pos,posc,Cell,Hsize,cut);
    [Wave,E] = eig(Ham);
%     emod(i,:) = E;
%     ewave(i,:) = Wave;
    toc
end
size(Wave)
size(E)
% CBandMin = min(plot_dat(:,Hsize/2-1+1));
% Sgap = (CBandMin-VBandMax)*1000
% 
%plot_wave = Wave;
for i = 1:Hsize
    for j = 1:Hsize
        Wave_abs_square(i,j) = abs(Wave(i,j))^2;
    end
end
plot_wave = Wave_abs_square;
save plot_wave_Gamma.dat plot_wave -ascii

plot_dat = diag(E);
save plot_Ene.dat plot_dat -ascii
