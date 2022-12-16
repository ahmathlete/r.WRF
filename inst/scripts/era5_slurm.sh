#!/bin/bash

#Submit this script with: sbatch thefilename

#SBATCH --time=X.TIME  # walltime
#SBATCH --ntasks=X.TASK
#SBATCH --cpus-per-task=2  # number of processor cores (i.e. threads)
#SBATCH --partition=haswell
#SBATCH --mem-per-cpu=X.MEM   # memory per CPU core
#SBATCH -J "X.JOB"   # job name
#SBATCH --mail-user=X.EMAIL  # email address
#SBATCH --mail-type=BEGIN,END,FAIL,REQUEUE
#SBATCH -A p_precipitation_systems
#SBATCH --output=outp-m-%j.out
#SBATCH --error=erro-m-%j.out

#export WORKING_DIR=/path/to/your/code

#cd $WORKING_DIR
# The following sleep command was reported to fix warnings/errors with srun by
# users (feel free to uncomment).
sleep 5
srun --exclusive --ntasks=1 python3 script.py &

echo "Waiting for parallel job steps to complete..."
wait
echo "All parallel job steps completed!"
