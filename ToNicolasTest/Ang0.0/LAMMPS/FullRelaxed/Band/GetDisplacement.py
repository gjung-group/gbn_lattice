import numpy as np
import matplotlib.pyplot as plt
aG = 2.4602
acc = aG/np.sqrt(3.0)

thetaRAAVec = []
ratioVec = []
ratioVecSP = []

data = np.genfromtxt("./generateG.xyz",skip_header=4)
dataI = np.genfromtxt("./generateGInit.xyz",skip_header=4)

xdata = data[:,1]
ydata = data[:,2]
zdata = data[:,3]

xdataI = dataI[:,1]
ydataI = dataI[:,2]
zdataI = dataI[:,3]

cutoff = 10000

xdataC = xdata[np.logical_and(xdata<cutoff, ydata<cutoff)]
ydataC = ydata[np.logical_and(xdata<cutoff, ydata<cutoff)]
zdataC = zdata[np.logical_and(xdata<cutoff, ydata<cutoff)]

xdataIC = xdataI[np.logical_and(xdata<cutoff, ydata<cutoff)]
ydataIC = ydataI[np.logical_and(xdata<cutoff, ydata<cutoff)]
zdataIC = zdataI[np.logical_and(xdata<cutoff, ydata<cutoff)]

xdataC_top = xdataC[zdataIC>17.5]
ydataC_top = ydataC[zdataIC>17.5]
zdataC_top = zdataC[zdataIC>17.5]

xdataIC_top = xdataIC[zdataIC>17.5]
ydataIC_top = ydataIC[zdataIC>17.5]
zdataIC_top = zdataIC[zdataIC>17.5]


xdataC_bottom = xdataC[zdataIC<17.5]
ydataC_bottom = ydataC[zdataIC<17.5]
zdataC_bottom = zdataC[zdataIC<17.5]

xdataIC_bottom = xdataIC[zdataIC<17.5]
ydataIC_bottom = ydataIC[zdataIC<17.5]
zdataIC_bottom = zdataIC[zdataIC<17.5]

b_x = xdataC_bottom
b_y = ydataC_bottom
b_z = zdataC_bottom

t_x = xdataC_top
t_y = ydataC_top
t_z = zdataC_top

b_xI = xdataIC_bottom
b_yI = ydataIC_bottom
b_zI = zdataIC_bottom

t_xI = xdataIC_top
t_yI = ydataIC_top
t_zI = zdataIC_top

print(len(b_x),len(t_x))
print(xdata,ydata,zdata)

layerIndex = []
for z in zdataI:
    if z > 18:
        layerIndex.append(1)
    elif z < 18:
        layerIndex.append(2)
    else:
        print('something wrong')

sublattices = np.genfromtxt("./sublatticesSorted.dat")[:,1]
sublatticeC = sublattices[zdataIC>18]
print(sublatticeC)
sublatticeBN = sublattices[zdataIC<18]
print(sublatticeBN)

g = open('./generateG.xyz','r').readlines()[:4] # Get the unit cell size
v = g[0].split()
a1x = float(v[0])
a1y = float(v[1])
v = g[1].split()
a2x = float(v[0])
a2y = float(v[1])

#Make supercell
super_x2_top = list(t_x)
super_y2_top = list(t_y)
super_z2_top = list(t_z)
for supercellx in range(3):
    for supercelly in range(3):
        if supercellx-1 != 0 or supercelly-1 != 0:
            for temp_x,temp_y,temp_z in zip(t_x,t_y,t_z):
                tempx = temp_x+a1x*(supercellx-1)+a2x*(supercelly-1)
                tempy = temp_y+a1y*(supercellx-1)+a2y*(supercelly-1)
                tempz = temp_z
                super_x2_top.append(tempx)
                super_y2_top.append(tempy)
                super_z2_top.append(tempz)
super_x2_top = np.array(super_x2_top)
super_y2_top = np.array(super_y2_top)
super_z2_top = np.array(super_z2_top)
            
super_x2I_top = list(t_xI)
super_y2I_top = list(t_yI)
super_z2I_top = list(t_zI)
supercell_sublattice_t = list(sublatticeC)
for supercellx in range(3):
    for supercelly in range(3):
        if supercellx-1 != 0 or supercelly-1 != 0:
            for temp_x,temp_y,temp_z,SL in zip(t_xI,t_yI,t_zI,sublatticeC):
                tempx = temp_x+a1x*(supercellx-1)+a2x*(supercelly-1)
                tempy = temp_y+a1y*(supercellx-1)+a2y*(supercelly-1)
                tempz = temp_z
                super_x2I_top.append(tempx)
                super_y2I_top.append(tempy)
                super_z2I_top.append(tempz)
                supercell_sublattice_t.append(SL)
super_x2I_top = np.array(super_x2I_top)
super_y2I_top = np.array(super_y2I_top)
super_z2I_top = np.array(super_z2I_top)    

super_x2_bottom = list(b_x)
super_y2_bottom = list(b_y)
super_z2_bottom = list(b_z)
supercell_sublattice_b = list(sublatticeBN)
for supercellx in range(3):
    for supercelly in range(3):
        if supercellx-1 != 0 or supercelly-1 != 0:
            for temp_x,temp_y,temp_z,SL in zip(t_x,t_y,t_z,sublatticeBN):
                tempx = temp_x+a1x*(supercellx-1)+a2x*(supercelly-1)
                tempy = temp_y+a1y*(supercellx-1)+a2y*(supercelly-1)
                tempz = temp_z
                super_x2_bottom.append(tempx)
                super_y2_bottom.append(tempy)
                super_z2_bottom.append(tempz)
                supercell_sublattice_b.append(SL)
super_x2_bottom = np.array(super_x2_bottom)
super_y2_bottom = np.array(super_y2_bottom)
super_z2_bottom = np.array(super_z2_bottom)
            
super_x2I_bottom = list(t_xI)
super_y2I_bottom = list(t_yI)
super_z2I_bottom = list(t_zI)
for supercellx in range(3):
    for supercelly in range(3):
        if supercellx-1 != 0 or supercelly-1 != 0:
            for temp_x,temp_y,temp_z in zip(t_xI,t_yI,t_zI):
                tempx = temp_x+a1x*(supercellx-1)+a2x*(supercelly-1)
                tempy = temp_y+a1y*(supercellx-1)+a2y*(supercelly-1)
                tempz = temp_z
                super_x2I_bottom.append(tempx)
                super_y2I_bottom.append(tempy)
                super_z2I_bottom.append(tempz)
super_x2I_bottom = np.array(super_x2I_bottom)
super_y2I_bottom = np.array(super_y2I_bottom)
super_z2I_bottom = np.array(super_z2I_bottom)  


del_r = []
del_x = []
del_y = []

#print(xdataBN)
for x1, y1, z1, x1I, y1I, z1I, SL in zip(t_x,t_y,t_z,t_xI,t_yI,t_zI, sublatticeC):
    diffMin = 100
    dxMin = 100
    dyMin = 100
    for x2, y2, z2, x2I, y2I, z2I, SL2 in zip(super_x2_bottom,super_y2_bottom,super_z2_bottom,super_x2I_bottom,super_y2I_bottom,super_z2I_bottom, supercell_sublattice_b):
        diff1 = np.sqrt((x2-x1)**2 + (y2-y1)**2)# + (z2I-z1I)**2)\
        dx = x2-x1
        dy = y2-y1
        if (diff1 < diffMin and SL + 2 == SL2):
            #print("hi")
            diffMin = diff1
            dxMin = x2-x1
            dyMin = y2-y1
    
    del_r.append(diffMin)
    del_x.append(dxMin)
    del_y.append(dyMin)
    
cutoffbis = 10000

with open('displacementsCarrFormat.txt', 'w') as f1:
    for x, y, z, disp, dxVal, dyVal  in zip(t_x, t_y, t_z, del_r, del_x, del_y):#, dzTop):
        if (x<cutoffbis and y<cutoffbis):
            f1.write(str(x) + "   " + str(y) + "   " + str(z) + "  " + str(disp)  + "   " + str(dxVal) + "   " + str(dyVal) +"\n")
            
            
del_r = []
del_x = []
del_y = []
    
    #print(xdataBN)
for x1, y1, z1, x1I, y1I, z1I, SL in zip(b_x,b_y,b_z,b_xI,b_yI,b_zI, sublatticeBN):
    diffMin = 100
    dxMin = 100
    dyMin = 100
    for x2, y2, z2, x2I, y2I, z2I, SL2 in zip(super_x2_top,super_y2_top,super_z2_top,super_x2I_top,super_y2I_top,super_z2I_top, supercell_sublattice_t):
        diff1 = np.sqrt((x2-x1)**2 + (y2-y1)**2)# + (z2I-z1I)**2)\
        dx = x2-x1
        dy = y2-y1
        if (diff1 < diffMin and SL - 2 == SL2):
            #print("hi")
            diffMin = diff1
            dxMin = x2-x1
            dyMin = y2-y1
    
    del_r.append(diffMin)
    del_x.append(dxMin)
    del_y.append(dyMin)
    
cutoffbis = 10000

with open('displacementsCarrFormatBN.txt', 'w') as f1:
    for x, y, z, disp, dxVal, dyVal  in zip(b_x, b_y, b_z, del_r, del_x, del_y):#, dzTop):
        if (x<cutoffbis and y<cutoffbis):
            f1.write(str(x) + "   " + str(y) + "   " + str(z) + "  " + str(disp)  + "   " + str(dxVal) + "   " + str(dyVal) +"\n")


