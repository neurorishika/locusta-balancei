#!/bin/bash

srun unit_test.sh 0 &
srun unit_test.sh 1 &
srun unit_test.sh 2 &
srun unit_test.sh 3 &
wait
