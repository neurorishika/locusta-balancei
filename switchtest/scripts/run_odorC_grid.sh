#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=tensorflow
#SBATCH --partition=standard

srun -N1 scripts/run_odorC_trials.sh '0.0' '0.22' &
srun -N1 scripts/run_odorC_trials.sh '1.0' '0.22' &
srun -N1 scripts/run_odorC_trials.sh '2.0' '0.22' &
srun -N1 scripts/run_odorC_trials.sh '0.0' '0.18' &
srun -N1 scripts/run_odorC_trials.sh '1.0' '0.18' &
srun -N1 scripts/run_odorC_trials.sh '2.0' '0.18' &
srun -N1 scripts/run_odorC_trials.sh '0.0' '0.14' &
srun -N1 scripts/run_odorC_trials.sh '1.0' '0.14' &
srun -N1 scripts/run_odorC_trials.sh '2.0' '0.14' &
wait
