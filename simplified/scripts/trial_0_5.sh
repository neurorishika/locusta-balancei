#!/bin/sh
cd $SLURM_SUBMIT_DIR

file="/home/collins/locusta-balancei/simplified/exp_label"
name=$(cat "$file")
name="${name}_$1_$2"

module load python/3.7
python /home/collins/locusta-balancei/simplified/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_5.locust' 0 $name $1 $2
python /home/collins/locusta-balancei/simplified/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_5.locust' 1 $name $1 $2
python /home/collins/locusta-balancei/simplified/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_5.locust' 2 $name $1 $2
python /home/collins/locusta-balancei/simplified/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_5.locust' 3 $name $1 $2
python /home/collins/locusta-balancei/simplified/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_5.locust' 4 $name $1 $2
