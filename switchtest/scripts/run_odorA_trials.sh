#!/bin/sh
cd $SLURM_SUBMIT_DIR

file="/home/collins/locusta-balancei/switchtest/exp_label"
name=$(cat "$file")
name="${name}_$1_$2"

module load python/3.7
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 0 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 1 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 2 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 3 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 4 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 5 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 6 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 7 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 8 $name $1 $2
python /home/collins/locusta-balancei/switchtest/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_0_2.locust' 9 $name $1 $2
