clear all
clc
tbt = 144*1e-3 ; %eV # tBC
% tbt = 97*1e-3 ; %eV # tNC

a = 1;
phi = 2*pi/3;
K = 4*pi/(3*a); %Dirac point
Gp = K*[-3/2,sqrt(3)/2];
Gm = K*[-3/2,-sqrt(3)/2];

N = 20;
dx = linspace(0,a,N);
dy = linspace(0,a*sqrt(3),N); 

HAAp =@(x,y) tbt*(1+exp(-1j*dot(Gp,[x,y])) + exp(-1j*dot(Gm,[x,y]))  );
HBBp = HAAp;
HABp =@(x,y) tbt*(1+ ( exp(-1j*phi) * exp(-1j*dot(Gp,[x,y])) ) + ( ( exp(1j*phi) * exp(-1j*dot(Gm,[x,y])) ) ) );
HBAp =@(x,y) tbt*(1+ ( exp(1j*phi) * exp(-1j*dot(Gp,[x,y])) ) + ( ( exp(-1j*phi) * exp(-1j*dot(Gm,[x,y])) ) ) );

%        1     2     3     4
sub = ['AAp','BBp','ABp','BAp']; 
sprintf(' type = 1 : AA'' \n type = 2 : BB'' \n type = 3 : AB'' \n type = 4 : BA'' ')
type = input(' Enter type of sublattice hopping process : ') ;

for ii = 1:N
    for jj = 1:N
        
        x = dx(jj);
        y = dy(ii);
        
    AAp(ii,jj) =  HAAp(x,y);
    BBp(ii,jj) =  HAAp(x,y);
    ABp(ii,jj) =  HABp(x,y);
    BAp(ii,jj) =  HBAp(x,y);

    end 
end

if type == 1
    indices = 'AAp'

figure1 = figure;
surf(dx,dy,real(AAp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('A -> A'' : re{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure1.Position=[F1 F2 F3 F4];
filename = strcat('Re_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));

figure2 = figure;
surf(dx,dy,imag(AAp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('A -> A'' : Im{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure2.Position=[F1 F2 F3 F4];
filename = strcat('Im_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));
elseif type == 2
        indices = 'BBp'

figure1 = figure;
surf(dx,dy,real(BBp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('B -> B'' : re{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure1.Position=[F1 F2 F3 F4];
filename = strcat('Re_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));

figure2 = figure;
surf(dx,dy,imag(BBp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('B -> B'' : Im{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure2.Position=[F1 F2 F3 F4];
filename = strcat('Im_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));

elseif type == 3
        indices = 'ABp'

figure1 = figure;
surf(dx,dy,real(ABp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('A -> B'' : re{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure1.Position=[F1 F2 F3 F4];
filename = strcat('Re_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));

figure2 = figure;
surf(dx,dy,imag(ABp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('A -> B'' : Im{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure2.Position=[F1 F2 F3 F4];
filename = strcat('Im_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));
elseif type == 4
        indices = 'BAp'

figure1 = figure;
surf(dx,dy,real(BAp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('B -> A'' : re{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure1.Position=[F1 F2 F3 F4];
filename = strcat('Re_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));

figure2 = figure;
surf(dx,dy,imag(BAp))
shading interp
set(gca,'fontweight','bold','fontsize',20,'FontWeight','bold') 
title('B -> A'' : Im{H(K:d)}  ','Fontsize',20)
ylabel('dy')
xlabel('dx')
zlabel('E (eV)')
ylim([0 a*sqrt(3)])
xlim([0 a])
view([0 90])
colorbar
F1=400;F2=550;F3=400;F4=550;
figure2.Position=[F1 F2 F3 F4];
filename = strcat('Im_',indices,'.png');
% saveas(gcf,filename);
% saveas(figure1,strcat('Re_',indices,'.fig'));
end
%}




