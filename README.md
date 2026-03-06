# gbn_lattice

This repository contains the data and scripts used to generate the
figures in the manuscript:

**Jiaqi An, Nicolas Leconte, Srivani Javvaji, Youngju Park, and Jeil
Jung**\
*Atomistic substrate relaxation effects in the band gaps of graphene on
hexagonal boron nitride*

The repository is organized according to the figures presented in the
manuscript. Each directory contains the datasets and plotting scripts
required to reproduce the corresponding figure.

------------------------------------------------------------------------

# Repository Structure

    GeometryStructure (Fig. 1, Fig. 2)
    InterlayerTunnelingData (Fig. 4)
    Band_AndWaveDistribution_MatlabBandStructureCode (Fig. 5)
    AngleDependedGap (Fig. 6)
    QuiverPlot (Fig. 7)
    MaximumTwistAngle (Fig. 8)

## Directory Description

### GeometryStructure

Data and scripts used to generate the relaxed geometries and structural
analysis shown in **Figures 1 and 2**.

### InterlayerTunnelingData

Data used to compute and visualize the interlayer tunneling parameters
presented in **Figure 4**.

### Band_AndWaveDistribution_MatlabBandStructureCode

MATLAB scripts and data used to compute band structures and wavefunction
distributions for **Figure 5**.

### AngleDependedGap

Scripts and datasets used to calculate the twist-angle-dependent band
gap shown in **Figure 6**.

### QuiverPlot

Scripts for generating displacement vector (quiver) plots shown in
**Figure 7**.

### MaximumTwistAngle

Data and analysis used to determine the maximum twist angle discussed in
**Figure 8**.

------------------------------------------------------------------------

# Reproducing the Figures

Each directory contains the necessary data and scripts to reproduce the
corresponding figure in the manuscript.

In most cases, the figure can be reproduced by running the plotting
script provided in the directory.

Example workflow:

``` bash
cd GeometryStructure
python plot_geometry.py
```

(Some figures rely on MATLAB scripts instead of Python.)

------------------------------------------------------------------------

# Requirements

Depending on the figure, the scripts require:

### Python

-   Python 3.8
-   numpy
-   matplotlib

### MATLAB

Some band structure calculations and wavefunction visualizations are
implemented in MATLAB.

------------------------------------------------------------------------

# Citation

If you use this repository or the data provided here in your research,
please cite the associated publication:

``` bibtex
@article{An_graphene_hBN_relaxation,
  title   = {Atomistic substrate relaxation effects in the band gaps of graphene on hexagonal boron nitride},
  author  = {An, Jiaqi and Leconte, Nicolas and Javvaji, Srivani and Park, Youngju and Jung, Jeil},
  journal = {Physical Review B},
  year    = {XXXX}
}
```

(Replace the year and volume information once the final publication
details are available.)

------------------------------------------------------------------------

# Authors

-   Jiaqi An\
-   Nicolas Leconte\
-   Srivani Javvaji\
-   Youngju Park\
-   Jeil Jung

------------------------------------------------------------------------

# License

Please cite the associated publication if you use this repository in
your research.

