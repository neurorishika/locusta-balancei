#!/bin/bash

#SBATCH -N 5
#SBATCH --time=12:00:00
#SBATCH --job-name=tensorflow
#SBATCH --error=out/job.%J.err
#SBATCH --output=out/job.%J.out
#SBATCH --partition=standard

srun -lN1 -r 0 slurm_locust.sh '0.0' 'A' 'B_45' &
srun -lN1 -r 1 slurm_locust.sh '0.01' 'A' 'B_45' &
srun -lN1 -r 2 slurm_locust.sh '0.1' 'A' 'B_45' &
srun -lN1 -r 3 slurm_locust.sh '1.0' 'A' 'B_45' &
srun -lN1 -r 4 slurm_locust.sh '10.0' 'A' 'B_45'
