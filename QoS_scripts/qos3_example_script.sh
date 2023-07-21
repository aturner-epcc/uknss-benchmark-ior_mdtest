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

# PATH TO MDTEST - set the below variable to the MDTEST binary path

MDTEST_PATH=/home/user/ior-3.3.0/src/mdtest

# WORK DIRECTORY - set to the base directory where the work for each job
# will get done, where directory_1, directory_2, directory_3, directory_4
# and directory_5 will need to be created

WORK=/scratch/user/results

# For srun -N is the number of compute nodes per job -n is the 
# number of MPI threads and should correspond with the total number 
# of tasks per job

# ONE JOB

echo "ONE JOB No QoS"
srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_1 -N 16

# 1-5 JOBS QoS

for j in 1 2 3 4 5
	# This is where you set QoS for the new directory
        do echo $j "JOBS QoS"
		for ((i=1; i<=$j; i++))
		do srun -N 4 -n 64 $MDTEST_PATH -F -C -T -r -n 16384 -d $WORK/directory_$i -N 16 &
		done
		wait
	done

#This is where you unset QoS for all directories

