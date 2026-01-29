import numpy as np
import matplotlib.pyplot as plt
import os
from numpy import sqrt
import matplotlib
from matplotlib import gridspec
from matplotlib.pyplot import *

from mpl_toolkits.axes_grid1 import make_axes_locatable

def latexify(fig_width=None, fig_height=None, columns=1):
    """Set up matplotlib's RC params for LaTeX plotting.
    Call this before plotting a figure.

    Parameters
    ----------
    fig_width : float, optional, inches
    fig_height : float,  optional, inches
    columns : {1, 2}
    """

    # code adapted from http://www.scipy.org/Cookbook/Matplotlib/LaTeX_Examples

    # Width and max height in inches for IEEE journals taken from
    # computer.org/cms/Computer.org/Journal%20templates/transactions_art_guide.pdf

    assert(columns in [1,2])

    if fig_width is None:
        fig_width = 3.39 if columns==1 else 6.9 # width in inches

    if fig_height is None:
        golden_mean = (sqrt(5)-1.0)/2.0    # Aesthetic ratio
        fig_height = fig_width*golden_mean # height in inches

    #MAX_HEIGHT_INCHES = 7.0
    #if fig_height > MAX_HEIGHT_INCHES:
    #    print("WARNING: fig_height too large:" + fig_height + 
    #          "so will reduce to" + MAX_HEIGHT_INCHES + "inches.")
    #    fig_height = MAX_HEIGHT_INCHES

    params = {'backend': 'ps',
              'text.latex.preamble': [r'\usepackage{gensymb}'],
              'axes.labelsize': 8, # fontsize for x and y labels (was 10)
              'axes.titlesize': 8,
              'font.size': 8, # was 10
              'legend.fontsize': 8, # was 10
              'xtick.labelsize': 8,
              'ytick.labelsize': 8,
              'text.usetex': True,
              'figure.figsize': [fig_width,fig_height],
              'font.family': 'serif',
              'figure.autolayout': True,
              'lines.linewidth' : 1.0
    }

    matplotlib.rcParams.update(params)


def format_axes(ax):
    
    SPINE_COLOR = 'gray'

    for spine in ['top', 'right']:
        ax.spines[spine].set_visible(False)

    for spine in ['left', 'bottom']:
        ax.spines[spine].set_color(SPINE_COLOR)
        ax.spines[spine].set_linewidth(0.5)

    ax.xaxis.set_ticks_position('bottom')
    ax.yaxis.set_ticks_position('left')

    for axis in [ax.xaxis, ax.yaxis]:
        axis.set_tick_params(direction='out', color=SPINE_COLOR)

    return ax

import os
from matplotlib.pyplot import *
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.gridspec as gridspec

def getBandstructure(dir1, nPlotBands, EShift):

    f = open(dir1+'/generate.bands.dat','r')
    
    
    i = 0
    j = 0
    l = 0
    
    k = []
    E = []
    
    kVec = []
    EVec = []
    
    counterPlotBands = 0
    
    for line in f:
        i = i+1
        a = line.split()
        if i==10:
            nbands = int(a[5])
            nk = int(a[7])
            print(nbands,nk)
        if i>15:
            if len(a)==0:
                j = j+0.5
                #print(j)
            else:
                if (int(j)==int(nbands/2-nPlotBands/2 + counterPlotBands) and int(j) < int(nbands/2+nPlotBands/2)):
                    if l<nk:
                        k.append(float(a[0]))
                        E.append(float(a[1])-EShift)
                        l = l+1
                    if l==nk:
                        kVec.append(k)
                        EVec.append(E)
                        l = 0
                        counterPlotBands += 1
                        k = []
                        E = []
                        
    return kVec, EVec

emin = -1.3
emax = -0.8

nPlotBands = 100

latexify(columns=2, fig_height=4.5)

g1 = gridspec.GridSpec(1, 1)#, height_ratios=[6,1])
g1.update(wspace=0.2, hspace=0.4) # set the spacing between axes.

fig, (ax0) = plt.subplots(1, 1,sharey = "row")

ax0 = subplot(g1[0])

EShift = 0.3
dir1 = "./"
kVec, EVec = getBandstructure(dir1, nPlotBands, EShift)

i = 0
for el1, el2 in zip(kVec,EVec):
    i = i+1
    if (i==nPlotBands/2):
        ax0.plot(el1, el2,"k")
        valan1_max = max(el2)
    elif (i==nPlotBands/2+1):
        ax0.plot(el1, el2,"k")
        conduct1_min = min(el2)
    elif (i==nPlotBands/2-1):
        ax0.plot(el1, el2,"r")
        valance2_min = min(el2)
    elif (i==nPlotBands/2-2):
        ax0.plot(el1, el2,"r")
        valance3_max = max(el2)
    elif (i==nPlotBands/2+8):
        ax0.plot(el1, el2,"k")
#        ax0.plot(el1[:3], el2[:3],"r")
    else:
        ax0.plot(el1, el2,"k")

i = 0       
        
print('Primary Gap = ', (conduct1_min-valan1_max)*1000)
print('Secondary Gap = ', (valance2_min-valance3_max)*1000)

#kpoint = 0.0
#gpoint = 0.030956
#mpoint = 0.057766
#kppoint = 0.073244
#ax0.set_title("Ang0.0")
#ax0.set_ylim([emin,emax])
#ax0.set_xlim([kpoint,kppoint])
#ax0.set_xticks([kpoint,gpoint,mpoint,kppoint])
#ax0.set_xticklabels(["Gamma","M","K","Gamma"])
#ax0.axvline(gpoint,linestyle="dashed",color="grey")
#ax0.axvline(mpoint,linestyle="dashed",color="grey")
#ax0.axhline(conduct1_min,linestyle="dashed",color="grey")
#ax0.axhline(valan1_max,linestyle="dashed",color="grey")
#ax0.axhline(valance2_min,linestyle="dashed",color="grey")
#ax0.axhline(valance3_max,linestyle="dashed",color="grey")
#ax0.axvline(gppoint,linestyle="dashed",color="grey")

#os.chdir("./")
#fig.savefig("Ang0.0.jpg",dpi=400,bbox_inches="tight")
