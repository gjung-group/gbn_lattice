#!/bin/sh
##PBS -l nodes=2:mem128:ppn=20
##PBS -l nodes=2:mem512:ppn=20
#PBS -l nodes=1:ppn=20
#PBS -q mem128
#PBS -N LAMMPS

ulimit -s unlimited
#ulimit -s 1700
#NPROCS=`wc -l < $PBS_NODEFILE`

hostname
date

#cd $PBS_O_WORKDIR

date

#export OMP_NUM_THREADS=24
#export KMP_STACKSIZE=20g

mpirun -np 20 /home/vincentan/github/lammps2/lammps/build/lmp -in lammps_cg.in
#mpirun -np 100 /home1/vincentan2/SoftWare/lammps/build/lmp -in lammps_cg.in
