#!/bin/bash

# This is an example job script for running QoS test #1
# executing IOR jobs with near simultaneity

#SBATCH --job-name=QOS_job

# --nodes=X where X is the total number of compute nodes that will be
# used for all five jobs at once. Use the number of nodes that you needed
# to saturate and multiply by 5.

#SBATCH --nodes=25
#SBATCH --time=1:00:00
#SBATCH --constraint=cpu

# -N is the number of compute nodes per job -n is the number of MPI threads
# and should correspond with the numTasks variable in the IOR script

# PATH TO IOR - set the below variable to the IOR binary path

IOR_PATH=/home/user/ior-3.3.0/src/ior

# PATH TO IOR SCRIPT - set the below variable to the IOR script

IOR_SCRIPT=/home/user/input.N10/load1-posix-NtoN.ior

# WORK DIRECTORY - set to the base directory where the work for each job
# will get done, where directory_1, directory_2, directory_3, directory_4
# and directory_5 will reside

WORK=/scratch/user/results

# TWO JOBS

echo "TWO JOBS"

# Here's where you would set the read and write QoS for directory_1
# and directory_2

cd $WORK/directory_1
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_2
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &

wait

# THREE JOBS

echo "THREE JOBS"

# Here's where you would set the read and write Qos for directory_1, directory_2,
# and directory_3

cd $WORK/directory_1
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_2
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_3
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &

wait

# FOUR JOBS

echo "FOUR JOBS"

# Here's where you would set the read and write Qos for directory_1, directory_2,
# directory_3, and directory_4

cd $WORK/directory_1
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_2
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_3
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_4
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &

wait

#FIVE JOBS

echo "FIVE JOBS"

# Here's where you would set the read and write Qos for directory_1, directory_2,
# directory_3, directory_4, and directory_5

cd $WORK/directory_1
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_2
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_3
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_4
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &
cd $WORK/directory_5
srun -N 5 -n 50 ior-3.3.0/src/ior -f input.N10/load1-posix-NtoN.ior &

wait
