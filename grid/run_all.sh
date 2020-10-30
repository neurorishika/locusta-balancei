sbatch -N25 scripts/run_odorA_grid.sh
sbatch -N25 scripts/run_odorB_grid.sh
sbatch -N25 scripts/run_odorC_grid.sh
watch "squeue | grep collins"
