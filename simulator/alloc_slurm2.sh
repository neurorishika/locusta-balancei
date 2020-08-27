#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=tensorflow
#SBATCH --error=out/job.%J.err
#SBATCH --output=out/job.%J.out
#SBATCH --partition=standard

srun -N1 script_slurmB.sh '0.0' &
srun -N1 script_slurmB.sh '0.01' &
srun -N1 script_slurmB.sh '0.1' &
srun -N1 script_slurmB.sh '1.0' &
srun -N1 script_slurmB.sh '10.0' &
wait
