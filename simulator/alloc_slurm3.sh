#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=tensorflow
#SBATCH --partition=standard

srun -N1 script_slurmC.sh '0.0' &
srun -N1 script_slurmC.sh '100.0' &
srun -N1 script_slurmC.sh '0.1' &
srun -N1 script_slurmC.sh '1.0' &
srun -N1 script_slurmC.sh '10.0' &
wait
