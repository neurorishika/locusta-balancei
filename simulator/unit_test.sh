#!/bin/sh

module load python/3.7
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 0 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 1 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 2 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 3 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 4 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 5 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 6 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 7 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 8 'benchmark' '1.0' &
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 9 'benchmark' '1.0' &
wait
