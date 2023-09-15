#!/bin/bash

#SBATCH --time=2:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=32
#SBATCH --account=try23_Belpassi
#SBATCH --exclusive

for mol in h2o au2 au4 au8 au16
do 
    for numt in 4 8 16 32 
    do
        cd /leonardo/home/userexternal/lstorchi/BERTHA/bertha_ng/bin/$mol
        export OMP_NUM_THREADS=$numt
        ./bertha.serial.omp.gpu 1> out.omp.gpu.$numt 2> err.omp.gpu.$numt
        cd ../
    done
done
