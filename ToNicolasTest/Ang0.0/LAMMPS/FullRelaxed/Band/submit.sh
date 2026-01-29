#!/bin/bash
#SBATCH -J EffectiveGBN_test         # job name
#SBATCH -o myMPI.o%j       # output and error file name (%j expands to jobID)
#SBATCH -p mem128
##SBATCH -N 1             # total number of nodes
#SBATCH -n 1              # total number of mpi tasks requested

## HPC ENVIRONMENT 
. /etc/profile.d/TMI.sh
##
/TGM/Apps/MATLAB/R2016b/bin/matlab -nodesktop -nodisplay -nosplash < Main.m >log
