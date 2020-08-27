#!/bin/bash

#SBATCH -N 3
#SBATCH --time=12:00:00
#SBATCH --job-name=tensorflow
#SBATCH --error=out/job.%J.err
#SBATCH --output=out/job.%J.out
#SBATCH --partition=standard

module load python/3.7

srun -lN1 -r 0 python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorC_90.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 0 'test_run_1.0' '1.0' &
srun -lN1 -r 1 python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorC_90.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 1 'test_run_1.0' '1.0' &
srun -lN1 -r 2 python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorC_90.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 2 'test_run_1.0' '1.0'
