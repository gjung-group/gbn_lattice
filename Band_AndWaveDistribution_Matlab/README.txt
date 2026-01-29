Tutorial: Graphene on h-BN Calculation using MATLAB Code
This tutorial provides instructions on how to use the MATLAB code to perform graphene on h-BN calculation. The necessary input files and functions are listed below:

Input.in: Defines the necessary input parameters in the code.
generateG.xyz: Lists the coordinates of relaxed atoms in the unit cell.
generateGInit.xyz: Lists the coordinates of rigid atoms in the unit cell.
sublatticesSorted.dat: Lists the sublattices of atoms in the unit cell.
displacementsCarrFormatall.txt: Lists the displacement on each atom with Carr Format.
Here is an explanation of the meaning and format for each input file:

Input.in: The first line identifies the input parameters for the code. The next two lines specify the z coordinate for each layer. Note that this code only works for a 2-layer system. Lines 4 and 5 specify the lattice constant value for graphene and h-BN, respectively. Line 6 specifies the twisted angle for the system, and line 7 specifies the global twisting while generating the unit cell, which is related to the displacement value.

generateG.xyz & generateGInit.xyz: The first three lines of these files list the lattice vector: (a1_x, a1_y, a1_z), (a2_x, a2_y, a2_z), (a3_x, a3_y, a3_z). The fourth line lists the total number of atoms in the unit cell. The rest of the lines list the coordinates of each atom, with the first column indicating the atom type, and the second to fourth columns specifying the x, y, and z coordinates.

sublatticesSorted.dat: The first column lists the index of each atom, in the same order as the atoms in generateG.xyz and generateGInit.xyz. The second column lists the sublattice of each atom.

displacementsCarrFormatall.txt: This file lists the displacement on each atom with Carr Format. The first three columns specify the x, y, and z coordinates, and the fourth column specifies the displacement value, d. The fifth and sixth columns specify the displacement along the x and y axes, respectively, dx and dy.

After preparing all the input files, place everything and the code in the same folder. Open the Main.m file and run the code. The output files are:

plot_dis_moire.dat: The band structure data
generate.e: The diagonal elements in the Hamiltonian matrix, which represent the onsite terms
plot_wave_K.dat and plot_wave_Gamma.dat: The wave function distribution for different energy at the K and Gamma points
plot_Ene.dat: The energy data related to the corresponding wave function data
Here is an explanation of the meaning and format for each output file:

plot_dis_moire.dat: The first column lists the K value (x axis while plotting), and the remaining columns list the band structure (y axis while plotting). To plot the band structure, open Plot.m and run.

plot_wave_K.dat & plot_wave_Gamma.dat & plot_Ene.dat: plot_Ene.dat lists the energy data. plot_wave_K.dat lists the wave function of corresponding energy in plot_Ene.dat at the K point, and plot_wave_Gamma.dat lists the wave function of corresponding energy in plot_Ene.dat at the Gamma point. To plot the wave function distribution, use the example provided in PlotWaveFunctionDistribution.ipynb.