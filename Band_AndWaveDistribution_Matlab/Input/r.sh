#!/bin/sh
##PBS -l nodes=2:mem128:ppn=20
##PBS -l nodes=2:mem512:ppn=20
#PBS -l nodes=1:ppn=20
#PBS -q mem128
#PBS -N SpectralFunction

ulimit -s unlimited
#ulimit -s 1700
#NPROCS=`wc -l < $PBS_NODEFILE`

hostname
date

#cd $PBS_O_WORKDIR

date

export OMP_NUM_THREADS=20
export KMP_STACKSIZE=5g

/home/vincentan/github/JeilCode3/JeilJungGroupCodes/lanczosKuboCode/bin/grabnes Gendata.in > job.out
