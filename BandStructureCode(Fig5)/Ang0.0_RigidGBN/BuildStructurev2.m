function [Cell,pos,posc]=BuildStructurev2(Flag,layer1,layer2)
%Current version could only build 2 layer, Optimize it to including more layers

if Flag == 'ReadXYZ'
    [x,y,z] = textread('generateG.xyz','%f%f%f',3);
    a1 = [x(1),y(1),z(1)];
    a2 = [x(2),y(2),z(2)];
    a3 = [x(3),y(3),z(3)];
    Cell = [a1;a2;a3];
    
    [index,sublattice] = textread('sublatticesSorted.dat','%f%f');
    [pos_1,pos_x,pos_y,pos_z] = textread('generateGInit.xyz','%f%f%f%f','headerlines',4);
    [pos_1c,pos_xc,pos_yc,pos_zc] = textread('generateG.xyz','%f%f%f%f','headerlines',4);
    [x,y,z,d,dx,dy] = textread('displacementsCarrFormatall.txt','%f%f%f%f%f%f');
    
    %Lattice vector
    if not(length(pos_1)==length(pos_x) && length(pos_x)==length(pos_y) && length(pos_y)==length(pos_z) && length(index)==length(pos_1)) 
        fprintf('Read Position incorrect')
        pause
    end
    if not(length(pos_1c)==length(pos_1))
        fprintf('Rigid and Relaxed structure is not correct')
        pause
    end
    pos = [];
    posc = [];
    for i = 1:length(pos_1)
        if pos_z(i) == layer2
            a1 = [pos_x(i),pos_y(i),pos_z(i),1,pos_1(i),sublattice(i),dx(i),dy(i),d(i)]; % a1 = [x, y, z, layer, atomtype] # Atom type 1 = B, 2 = N, 3 = C
            a1c = [pos_xc(i),pos_yc(i),pos_zc(i),1,pos_1c(i),sublattice(i),dx(i),dy(i),d(i)];
            pos = [pos;a1c];
            posc = [posc;a1];
        elseif pos_z(i) == layer1
            a1 = [pos_x(i),pos_y(i),pos_z(i),2,pos_1(i),sublattice(i),dx(i),dy(i),d(i)];
            a1c = [pos_xc(i),pos_yc(i),pos_zc(i),2,pos_1c(i),sublattice(i),dx(i),dy(i),d(i)];
            pos = [pos;a1c];
            posc = [posc;a1];
        else
            fprintf('More layer in generate.xyz file, check if necessary to include.')
        end
    end
elseif Flag == 'BuildStraightly'
    Cell = 0;
    pos = 0;
end
