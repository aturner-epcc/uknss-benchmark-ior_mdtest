#!/bin/bash

# This is an example job script for running QoS test #3
# executing mdtest jobs with near simultaneity

#SBATCH --job-name=QOS_job

# --nodes=X where X is the total number of compute nodes that will be
# used for all five jobs at once. Use the number of nodes that you needed
# to saturate and multiply by 5.

#SBATCH --nodes=20
#SBATCH --time=1:00:00
#SBATCH --constraint=cpu

# PATH TO IOR - set the below variable to the IOR binary path

MDTEST_PATH=/home/user/ior-3.3.0/src/mdtest

# WORK DIRECTORY - set to the base directory where the work for each job
# will get done, where directory_1, directory_2, directory_3, directory_4
# and directory_5 will reside

WORK=/scratch/user/results

# -N is the number of compute nodes per job -n is the number of MPI threads
# and should correspond with the total number of tasks per job

# TWO JOBS

echo "TWO JOBS"

# Here's where you would set the read and write QoS for directory_1
# and directory_2

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_1 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_2 -N 16  &

wait

echo "THREE JOBS"

# Here's where you would set the read and write Qos for directory_1, directory_2,
# and directory_3

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_1 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_2 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_3 -N 16  &

wait

echo "FOUR JOBS"

# Here's where you would set the read and write Qos for directory_1, directory_2,
# directory_3, and directory_4

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_1 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_2 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_3 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_4 -N 16  &

wait

echo "FIVE JOBS"

# Here's where you would set the read and write Qos for directory_1, directory_2,
# directory_3, directory_4, and directory_5

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_1 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_2 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_3 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_4 -N 16  &

srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_5 -N 16  &

wait
