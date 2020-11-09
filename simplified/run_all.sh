#sbatch -N1 scripts/test_grid.sh
sbatch -N24 scripts/grid_0_2.sh
sbatch -N24 scripts/grid_0_35.sh
sbatch -N24 scripts/grid_0_5.sh
watch "squeue | grep collins"
