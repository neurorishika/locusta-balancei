#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=tensorflow
#SBATCH --partition=standard

srun -N1 script_slurmCa.sh '0.000' &
srun -N1 script_slurmCa.sh '0.100' &
srun -N1 script_slurmCa.sh '0.316' &
srun -N1 script_slurmCa.sh '1.000' &
srun -N1 script_slurmCa.sh '3.162' &
srun -N1 script_slurmCa.sh '10.000' &
wait
