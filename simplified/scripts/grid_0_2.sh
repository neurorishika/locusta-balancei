#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=tensorflow
#SBATCH --partition=standard

srun -N1 scripts/trial_0_2.sh '0.0' '0.01' &
srun -N1 scripts/trial_0_2.sh '0.0' '0.02' &
srun -N1 scripts/trial_0_2.sh '0.0' '0.03' &
srun -N1 scripts/trial_0_2.sh '0.0' '0.04' &
srun -N1 scripts/trial_0_2.sh '0.4' '0.01' &
srun -N1 scripts/trial_0_2.sh '0.4' '0.02' &
srun -N1 scripts/trial_0_2.sh '0.4' '0.03' &
srun -N1 scripts/trial_0_2.sh '0.4' '0.04' &
srun -N1 scripts/trial_0_2.sh '0.8' '0.01' &
srun -N1 scripts/trial_0_2.sh '0.8' '0.02' &
srun -N1 scripts/trial_0_2.sh '0.8' '0.03' &
srun -N1 scripts/trial_0_2.sh '0.8' '0.04' &
srun -N1 scripts/trial_0_2.sh '1.2' '0.01' &
srun -N1 scripts/trial_0_2.sh '1.2' '0.02' &
srun -N1 scripts/trial_0_2.sh '1.2' '0.03' &
srun -N1 scripts/trial_0_2.sh '1.2' '0.04' &
srun -N1 scripts/trial_0_2.sh '1.6' '0.01' &
srun -N1 scripts/trial_0_2.sh '1.6' '0.02' &
srun -N1 scripts/trial_0_2.sh '1.6' '0.03' &
srun -N1 scripts/trial_0_2.sh '1.6' '0.04' &
srun -N1 scripts/trial_0_2.sh '2.0' '0.01' &
srun -N1 scripts/trial_0_2.sh '2.0' '0.02' &
srun -N1 scripts/trial_0_2.sh '2.0' '0.03' &
srun -N1 scripts/trial_0_2.sh '2.0' '0.04' &
wait
