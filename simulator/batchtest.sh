#!/bin/bash

srun -lN1 -r 0 python -c "import time;time.sleep(30)" &
srun -lN1 -r 1 python -c "import time;time.sleep(30)" &
srun -lN1 -r 2 python -c "import time;time.sleep(30)"
