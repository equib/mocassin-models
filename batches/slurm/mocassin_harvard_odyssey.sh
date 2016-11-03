#!/bin/bash
#SBATCH -p general            # Partition to submit to
#SBATCH -J mocassin           # Jon name
#SBATCH -n 16                 # Number of cores
#SBATCH -N 1                  # 1 if under 32 cores; >= 2 machines otherwise
#SBATCH -t 4-00:00            # Runtime in minutes
#SBATCH --contiguous          # Ensure that all of the cores are on the same Infiniband network
#SBATCH --mem-per-cpu=4000    # Memory per cpu in MB (see also --mem)
#SBATCH -o mocassin_%j.out    # File to which STDOUT will be written
#SBATCH -e mocassin_%j.err    # File to which STDERR will be written
#SBATCH --mail-type=BEGIN,END,FAIL  # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=youremail@mit.edu # Email to which notifications will be sent
#
module load gcc/4.8.2-fasrc01 openmpi/1.8.1-fasrc01
# 
mpirun -np $SLURM_NTASKS ./mocassin
#
echo = `date` job $JOB_NAME done.
echo "Program mocassin finished with exit code $? at: `date`" >> mocassin.info
