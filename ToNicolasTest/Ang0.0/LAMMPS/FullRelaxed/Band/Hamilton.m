function Ham=Hamilton(kx,ky,pos,posc,CellLattice,Hsize,cut)
global OnsiteC1 OnsiteC2 OnsiteB OnsiteN aG aBN theta phi eps eps2 CAB phiAB CAB_BN phiAB_BN

TempSize1 = size(pos);
TempSize2 = size(posc);
TempSize1 = TempSize1(1);
TempSize2 = TempSize2(1);
Cell = 5;
SumCell = (2*Cell+1)^2;

if (TempSize2 ~= TempSize1) || (TempSize2 ~= Hsize)
    fprintf('Size of Hamiltonian have mistakes')
    pause
end

%Ham = zeros(Hsize);
HamOnsite = zeros(Hsize);
HamHopping = zeros(Hsize);
%HAB = zeros(Hsize);

temp_disx = zeros(SumCell,1);    % These three values are for temp calculating nearest nine neighbor cell
temp_disy = zeros(SumCell,1);    
temp_dis = zeros(SumCell,1);

a1 = CellLattice(1,:);
a2 = CellLattice(2,:);
a3 = CellLattice(3,:);

alpha = eps+1;
alpha2 = eps2+1;
theta_rad = theta*pi/180;
phirad = (phi)*pi/180;
rotMat = [cos(phirad),sin(phirad);-sin(phirad),cos(phirad)];
%% Diagonal Elements
for i = 1:Hsize
    if pos(i,5) == 3
        x = pos(i,7)*rotMat(1,1)+pos(i,8)*rotMat(1,2);
        y = pos(i,7)*rotMat(2,1)+pos(i,8)*rotMat(2,2);
        dx = x;
        dx = dx/aG;
        dy = y;
        dy = dy/aG;  
    else
        x = pos(i,7)*rotMat(1,1)+pos(i,8)*rotMat(1,2);
        y = pos(i,7)*rotMat(2,1)+pos(i,8)*rotMat(2,2);
        dx = -x;
        dx = dx/aBN;
        dy = -y;
        dy = dy/aBN;  
    end
    if pos(i,5) == 3
        if pos(i,6) == 1
            B = -0.39969;
            C = -0.4277;
            A = -0.37776;
            HamOnsite(i,i) = HamOnsite(i,i)+Interpolation(dx,dy,A,B,C,1);
        elseif pos(i,6) == 2
            B = -0.42011;
            C = -0.42048;
            A = -0.36739;
            HamOnsite(i,i) = HamOnsite(i,i)+Interpolation(dx,dy,A,B,C,1);
        else
            fprintf('Onsite, Carbon, sublattice have mistake\n')
            pos(i,:)
            pause
        end
    elseif pos(i,5) == 1
        B = 2.3222;
        C = 2.3476;
        A = 2.2731;
        HamOnsite(i,i) = HamOnsite(i,i)+Interpolation(dx,dy,A,B,C,1);
        if pos(i,4) == 1
            fprintf('B or N atom on bottom layer, check configuration\n')
        end
    elseif pos(i,5) == 2
        B = -1.7795;
        C = -1.7778;
        A = -1.8324;
        HamOnsite(i,i) = HamOnsite(i,i)+Interpolation(dx,dy,A,B,C,1);
        if pos(i,4) == 1
            fprintf('B or N atom on bottom layer, check configuration\n')
        end    
    end
end



%% Hopping Elements
for i = 1:Hsize
    if pos(i,5) == 3
        x = pos(i,7)*rotMat(1,1)+pos(i,8)*rotMat(1,2);
        y = pos(i,7)*rotMat(2,1)+pos(i,8)*rotMat(2,2);
        dx = x;
        dx = dx/aG;
        dy = y;
        dy = dy/aG;  
    else
        x = pos(i,7)*rotMat(1,1)+pos(i,8)*rotMat(1,2);
        y = pos(i,7)*rotMat(2,1)+pos(i,8)*rotMat(2,2);
        dx = -x;
        dx = dx/aBN;
        dy = -y;
        dy = dy/aBN;  
    end
    G1 = 4.0*pi/(sqrt(3.0));
    HAB_ii = 2*CAB*cos(sqrt(3)*G1*dx/2)*cos(G1*dy/2-phiAB)-2*CAB*cos(G1*dy+phiAB)-1j*2*sqrt(3)*CAB*sin(sqrt(3)*G1*dx/2)*sin(G1*dy/2-phiAB);
    A_ii = real(HAB_ii);
    B_ii = imag(HAB_ii);
    delta1 = 2*A_ii/3;
    delta2 = -(A_ii+sqrt(3)*B_ii)/3;
    delta3 = (-A_ii+sqrt(3)*B_ii)/3;
    HAB_ii = 2*CAB_BN*cos(sqrt(3)*G1*dx/2)*cos(G1*dy/2-phiAB_BN)-2*CAB_BN*cos(G1*dy+phiAB_BN)-1j*2*sqrt(3)*CAB_BN*sin(sqrt(3)*G1*dx/2)*sin(G1*dy/2-phiAB_BN);
    A_ii_BN = real(HAB_ii);
    B_ii_BN = imag(HAB_ii);
    delta1_BN = 2*A_ii_BN/3;
    delta2_BN = -(A_ii_BN+sqrt(3)*B_ii_BN)/3;
    delta3_BN = (-A_ii_BN+sqrt(3)*B_ii_BN)/3;
    for j = 1:Hsize
        [temp_disx,temp_disy,temp_dis] = periodic_condition(Cell,temp_disx,temp_disy,temp_dis,pos(i,:),pos(j,:),a1,a2);
        temp_disz = pos(i,3)-pos(j,3);
        for k = 1:(SumCell)
            if temp_dis(k) < cut && ((temp_disx(k) ~= 0) || (temp_disy(k) ~= 0) || (temp_disz ~= 0))
                if pos(i,4) == pos(j,4) && pos(i,5) == 3 && pos(j,5) == 3
                    R = [temp_disx(k),temp_disy(k),temp_disz,temp_dis(k)];
                    HamHopping(i,j) = HamHopping(i,j)+Full_C(kx,ky,R,pos(i,:),pos(j,:),aG);
                    a_cc = aG/sqrt(3);
                    if pos(i,6) == 1 && abs(temp_disx(k)) < aG/2-0.001 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta1*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 1 && temp_disx(k) > 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta2*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 1 && temp_disx(k) < 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta3*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 2 && abs(temp_disx(k)) < aG/2-0.001 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta1*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 2 && temp_disx(k) > 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta3*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 2 && temp_disx(k) < 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta2*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        fprintf('Might have mistake\n')
                    end
                elseif pos(i,4) == pos(j,4) && not(pos(i,5) == 3 && pos(j,5) == 3)
                    R = [temp_disx(k),temp_disy(k),temp_disz,temp_dis(k)];
                    HamHopping(i,j) = HamHopping(i,j)+Full_BN(kx,ky,R,pos(i,:),pos(j,:),aBN);
                    a_cc = aBN/sqrt(3);
                    if pos(i,6) == 3 && abs(temp_disx(k)) < aG/2-0.001 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta1_BN*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 3 && temp_disx(k) > 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta2_BN*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 3 && temp_disx(k) < 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta3_BN*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 4 && abs(temp_disx(k)) < aG/2-0.001 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta1_BN*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 4 && temp_disx(k) > 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta3_BN*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif pos(i,6) == 4 && temp_disx(k) < 0 && temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        HamHopping(i,j) = HamHopping(i,j)+delta2_BN*exp(1i*(kx*temp_disx(k)+ky*temp_disy(k)));
                    elseif temp_dis(k) < a_cc+0.1*a_cc && temp_dis(k) > a_cc-0.1*a_cc
                        fprintf('Might have mistake\n')
                    end
                elseif pos(i,4) ~= pos(j,4)
                    R = [temp_disx(k),temp_disy(k),temp_disz,temp_dis(k)];
                    HamHopping(i,j) = HamHopping(i,j)+Interlayer(kx,ky,R,pos(i,:),pos(j,:));
                else
                    fprintf('Some near neighbor is not defined in the Hamiltonian')
                    pos(i,:)
                    pos(j,:)
                    HamHopping(i,j) = HamHopping(i,j)+0;
                end
            end
        end
    end
end

Ham =  (HamHopping+HamHopping')/2+HamOnsite;



    
