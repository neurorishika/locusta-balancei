sbatch -N1 scripts/test_grid.sh
# sbatch -N24 scripts/grid_0.2.sh
# sbatch -N24 scripts/grid_0.35.sh
# sbatch -N24 scripts/grid_0.5.sh
watch "squeue | grep collins"
