#!/bin/bash

#SBATCH -N 5
#SBATCH --time=12:00:00
#SBATCH --job-name=tensorflow
#SBATCH --error=out/job.%J.err
#SBATCH --output=out/job.%J.out
#SBATCH --partition=standard

srun -lN1 -r 0 script_slurmC.sh '0.0' &
srun -lN1 -r 1 script_slurmC.sh '0.01' &
srun -lN1 -r 2 script_slurmC.sh '0.1' &
srun -lN1 -r 3 script_slurmC.sh '1.0' &
srun -lN1 -r 4 script_slurmC.sh '10.0' &
wait
