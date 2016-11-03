#!/bin/bash
#SBATCH -A TG-PROJECT-NO      # TACC Project number
#SBATCH -p normal             # Partition to submit to
#SBATCH -J mocassin           # Jon name
#SBATCH -n 32                 # Number of cores
#SBATCH -t 48:00:00           # Runtime in minutes
#SBATCH -o mocassin_%j.out    # File to which STDOUT will be written
#SBATCH -e mocassin_%j.err    # File to which STDERR will be written
#SBATCH --mail-user=youremail@mit.edu # Email to which notifications will be sent
#SBATCH --mail-type=begin     # email me when the job starts
#SBATCH --mail-type=end       # email me when the job finishes
#
module load gcc mvapich2
#
ibrun -np 32 ./mocassin
#
echo = `date` job $JOB_NAME done.
echo "Program mocassin finished with exit code $? at: `date`" >> mocassin.info
