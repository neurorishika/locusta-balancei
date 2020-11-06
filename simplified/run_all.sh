sbatch -N1 scripts/test_grid.sh
watch "squeue | grep collins"
