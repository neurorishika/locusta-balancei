#!/bin/bash

#SBATCH -N 2
#SBATCH --time=12:00:00
#SBATCH --job-name=tensorflow
#SBATCH --error=out/job.%J.err
#SBATCH --output=out/job.%J.out
#SBATCH --partition=standard
#SBATCH --ntasks-per-node=2

srun -r 0 --cpus-per-task=24 unit_test.sh '0' &
srun -r 0 --cpus-per-task=24 unit_test.sh '1' &
srun -r 1 --cpus-per-task=24 unit_test.sh '2' &
srun -r 1 --cpus-per-task=24 unit_test.sh '3' &
wait
