sbatch -N6 alloc_slurm1a.sh
sbatch -N6 alloc_slurm1b.sh
sbatch -N6 alloc_slurm1c.sh
sbatch -N6 alloc_slurm2a.sh
sbatch -N6 alloc_slurm2b.sh
sbatch -N6 alloc_slurm2c.sh
sbatch -N6 alloc_slurm3a.sh
sbatch -N6 alloc_slurm3b.sh
sbatch -N6 alloc_slurm3c.sh
watch "squeue | grep collins"
