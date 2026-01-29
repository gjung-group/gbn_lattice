figure;

%plot_dat = load('plot_dis_moire_Full_Offdiag.dat','-ascii');
plot_dat = load('plot_dis_moire.dat','-ascii');
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
