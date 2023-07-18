#!/bin/bash

# This is an example job script for running QoS test #2
# executing IOR jobs with near simultaneity

#SBATCH --job-name=QOS_job

# --nodes=X where X is the total number of compute nodes that will be
# used for all five jobs at once. Use the number of nodes that you needed
# to saturate and multiply by 5.

#SBATCH --nodes=25
#SBATCH --time=1:00:00
#SBATCH --constraint=cpu

# PATH TO IOR - set the below variable to the IOR binary path

IOR_PATH=/home/user/ior-3.3.0/src/ior

# PATH TO IOR SCRIPT - set the below variable to the IOR script
# where you will need to set the correct variables

IOR_SCRIPT=/home/user/inputs.N10/load3-posix-random-NtoN.ior

# WORK DIRECTORY - set to the base directory where the work for each job
# will get done, where directory_1, directory_2, directory_3, directory_4
# and directory_5 will need to be created

WORK=/scratch/user/results

# For srun, -N is the number of compute nodes per job -n is the number 
# of MPI threads and should correspond with the numTasks variable in the 
# IOR script

# ONE JOB

for i in no_QoS QoS
do echo "ONE JOB" $i
if [ "$i" == "QoS" ]; then 
	#This is where you set Qos
	echo "set read and write BW Qos here"
fi

cd $WORK/directory_1
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT

if [ "$i" == "QoS" ]; then
        #This is where you unset Qos
        echo "unset read and write BW Qos here"
fi
done

# TWO JOBS

for i in no_QoS QoS
do echo "TWO JOBS" $i
if [ "$i" == "QoS" ]; then
        #This is where you set Qos
        echo "set read and write BW Qos here"
fi

cd $WORK/directory_1
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_2
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &

wait

if [ "$i" == "QoS" ]; then
        #This is where you unset Qos
        echo "unset read and write BW Qos here"
fi
done

# THREE JOBS

for i in no_QoS QoS
do echo "THREE JOB" $i
if [ "$i" == "QoS" ]; then
        #This is where you set Qos
        echo "set read and write BW Qos here"
fi

cd $WORK/directory_1
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_2
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_3
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &

wait

if [ "$i" == "QoS" ]; then
        #This is where you unset Qos
        echo "unset read and write BW Qos here"
fi
done

# FOUR JOBS

for i in no_QoS QoS
do echo "FOUR JOBS" $i
if [ "$i" == "QoS" ]; then
        #This is where you set Qos
        echo "set read and write BW Qos here"
fi

cd $WORK/directory_1
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_2
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_3
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_4
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &

wait

if [ "$i" == "QoS" ]; then
        #This is where you unset Qos
        echo "unset read and write BW Qos here"
fi
done

#FIVE JOBS

for i in no_QoS QoS
do echo "FIVE JOBS" $i
if [ "$i" == "QoS" ]; then
        #This is where you set Qos
        echo "set read and write BW Qos here"
fi

cd $WORK/directory_1
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_2
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_3
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_4
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &
cd $WORK/directory_5
srun -N 5 -n 50 $IOR_PATH -f $IOR_SCRIPT &

wait

if [ "$i" == "QoS" ]; then
        #This is where you unset Qos
        echo "unset read and write BW Qos here"
fi
done
