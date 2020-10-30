#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=tensorflow
#SBATCH --partition=standard

srun -N1 run_odorA_trials.sh '0.0' '0.22' &
srun -N1 run_odorA_trials.sh '0.5' '0.22' &
srun -N1 run_odorA_trials.sh '1.0' '0.22' &
srun -N1 run_odorA_trials.sh '1.5' '0.22' &
srun -N1 run_odorA_trials.sh '2.0' '0.22' &
srun -N1 run_odorA_trials.sh '0.0' '0.20' &
srun -N1 run_odorA_trials.sh '0.5' '0.20' &
srun -N1 run_odorA_trials.sh '1.0' '0.20' &
srun -N1 run_odorA_trials.sh '1.5' '0.20' &
srun -N1 run_odorA_trials.sh '2.0' '0.20' &
srun -N1 run_odorA_trials.sh '0.0' '0.18' &
srun -N1 run_odorA_trials.sh '0.5' '0.18' &
srun -N1 run_odorA_trials.sh '1.0' '0.18' &
srun -N1 run_odorA_trials.sh '1.5' '0.18' &
srun -N1 run_odorA_trials.sh '2.0' '0.18' &
srun -N1 run_odorA_trials.sh '0.0' '0.16' &
srun -N1 run_odorA_trials.sh '0.5' '0.16' &
srun -N1 run_odorA_trials.sh '1.0' '0.16' &
srun -N1 run_odorA_trials.sh '1.5' '0.16' &
srun -N1 run_odorA_trials.sh '2.0' '0.16' &
srun -N1 run_odorA_trials.sh '0.0' '0.14' &
srun -N1 run_odorA_trials.sh '0.5' '0.14' &
srun -N1 run_odorA_trials.sh '1.0' '0.14' &
srun -N1 run_odorA_trials.sh '1.5' '0.14' &
srun -N1 run_odorA_trials.sh '2.0' '0.14' &
wait
