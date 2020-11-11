#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=tensorflow
#SBATCH --partition=standard

srun -N1 scripts/run_odorC_trials.sh '1.5' '0.18' &
srun -N1 scripts/run_odorC_trials.sh '1.0' '0.18' &
srun -N1 scripts/run_odorC_trials.sh '0.5' '0.18' &
srun -N1 scripts/run_odorC_trials.sh '1.5' '0.16' &
srun -N1 scripts/run_odorC_trials.sh '1.0' '0.16' &
srun -N1 scripts/run_odorC_trials.sh '0.5' '0.16' &
srun -N1 scripts/run_odorC_trials.sh '1.5' '0.17' &
srun -N1 scripts/run_odorC_trials.sh '1.0' '0.17' &
srun -N1 scripts/run_odorC_trials.sh '0.5' '0.17' &
wait
