#!/bin/bash

#SBATCH --time=2:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=32
#SBATCH --account=try23_Belpassi
#SBATCH --exclusive

for mol in h2o 
do 
    for numt in 4 8 16 32 
    do
        cd /leonardo/home/userexternal/lstorchi/BERTHA/pybertha/pyberthart
        export OMP_NUM_THREADS=$numt
        python3 pyberthart.py -g $mol.xyz --fittset "H:aux4,O:aux4" \
            --obs "H:aug-cc-pvdz,O:aug-cc-pvdz" \
            --convertlengthunit=1.88972598 \
            --iterations 1> $mol.out.omp.gpu.$numt 2> $mol.err.omp.gpu.$numt 
        mv dipole.txt $mol.dipole.txt.omp.gpu.$numt
        cd ../
    done
done

for mol in au2 au4 au8 au16
do 
    for numt in 4 8 16 32 
    do
        cd /leonardo/home/userexternal/lstorchi/BERTHA/pybertha/pyberthart
        export OMP_NUM_THREADS=$numt
        python3 pyberthart.py -g $mol.xyz --fittset "Au:b20" \
            --obs "Au:dyall_vdz" \
            --iterations 1> $mol.out.omp.gpu.$numt 2> $mol.err.omp.gpu.$numt 
        mv dipole.txt $mol.dipole.txt.omp.gpu.$numt
        cd ../
    done
done
