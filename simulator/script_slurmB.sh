#!/bin/sh

cd $SLURM_SUBMIT_DIR

file="/home/collins/locusta-balancei/current_exp_label"
name=$(cat "$file")
name="${name}_$1"

module load python/3.7
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 0 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 1 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 2 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 3 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 4 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 5 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 6 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 7 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 8 $name $1
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorB_45.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_A.locust' 9 $name $1