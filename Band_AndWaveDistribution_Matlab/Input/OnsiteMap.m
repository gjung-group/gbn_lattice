%Draw interpolation map

[x,y,z,d,dy,d] = textread('displacementsCarrFormat.txt','%f%f%f%f%f%f');
[pos_1,pos_x,pos_y,pos_z] = textread('generateGInit.xyz','%f%f%f%f','headerlines',4);

Final = [];
for i = 1:length(pos_1)
    if pos_z(i) == 19.175
        tempx = pos_x(i);
        tempy = pos_y(i);
        tempdx = dx(i);
        tempdy = dy(i);
        temp = [tempx,tempy,tempdx,tempdy];
        Final = [Final;temp];
    end
end
scatter(Final(:,1),Final(:,2),[],Final(:,3))








% 
% B = -0.39969;
% C = -0.4277;
% A = -0.37776;
% Ave = (A+B+C)/3;
% OnsiteC1 = zeros(length(dxv),length(dyv));
% 
% for indexdx = 1:length(dxv)
%     for indexdy = 1:length(dyv)
%         dx = dxv(indexdx);
%         dy = dyv(indexdy);
%         OnsiteC1(indexdx,indexdy) = Interpolation(dx,dy,A,B,C,1)-Ave;
%     end
% end
% figure;
% s = surf(xx,yy,OnsiteC1');
% title('OnsiteC1')
% colorbar
% s.EdgeColor = 'none';
