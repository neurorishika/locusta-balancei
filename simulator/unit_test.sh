#!/bin/sh

module load python/3.7
python /home/collins/locusta-balancei/simulator/initExperiment.py '/home/collins/locusta-balancei/odors/odorA_0.odor' '/home/collins/locusta-balancei/protocol/Dur_6000_OdorDur_1000.protocol' '/home/collins/locusta-balancei/locust/Locust_C.locust' 0 'benchmark_$1' '1.0'
