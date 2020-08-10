#!/bin/sh

#SBATCH -N 1
#SBATCH --ntasks-per-node=48
#SBATCH --time=12:00:00
#SBATCH --job-name=tensorflow
#SBATCH --error=out/job.%J.err
#SBATCH --output=out/job.%J.out
#SBATCH --partition=standard
#SBATCH -a 0-1

cd $SLURM_SUBMIT_DIR

file="/home/collins/locusta-balancei/current_exp_label"
name=$(cat "$file")
name="${name}_1.0"

module load python/3.7
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' $SLURM_ARRAY_TASK_ID $name '1.0'
