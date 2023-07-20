NERSC-10 QSS Only Benchmarks
================

The intent of these benchmark is to demonstrate and measure the
effectiveness of the quality of service feature of the QoS storage
systems.
The QoS tests are required only for the QSS.


# I. Run Rules

Observed benchmark performance shall be obtained from a storage system
configured as closely as possible to the proposed QoS storage.

For the purposes of this test, the use of a scalable unit or subset of
the proposed scalable units is allowed.

The building blocks for these tests are IOR and mdtest runs which are
described in [`README.ior.N10.md`](README.ior.N10.md) and [`README.mdtest.N10.md`](README.mdtest.N10.md).


# II. Required Runs

The QoS evaluation can be applied to various test workloads, and has
the following basic steps:

1. Run the base test with a sufficient compute nodes to achieve maximum result on the filesystem or subset of the filesystem.  
2. For job counts of _n_ = 1, 2, 3, 4, and 5,
    - Set the QOS for each job to 20% of the maximum result measured in step 1. 
    - Run _n_ independent identical  jobs, all performing the base test simulteneously
    - Record the output for each job.
    - Remove the QoS setting
    - ( A total of 1 + 2 + 3  + 4 + 5 = 15 jobs is needed to complete step 2.)


The QoS experiment shall be performed for each of the following workloads.
Each experiment differs only in the base test and the type of QoS employed (bandwidth or IOPs).
An example Slurm batch script is provided to illustrate the procedure for each experiment. 

| Workload Description | Base Test | QoS Type(s) |  Slurm Script |
| ----------------- | --------| ---------- | --------- |
| IOR, sequential, N to N, reads and writes                         |    [`IOR test 1.d`](README.ior.N10.md#iii-required-runs)     |    read and write bandwidth |    [`qos1_example_script.sh`](QoS_scripts/qos1_example_script.sh) |
| IOR, random, small-transaction, N to N , reads and writes  |    [`IOR test 3.d`](README.ior.N10.md#iii-required-runs)     |    read and write IOPS |    [`qos2_example_script.sh`](QoS_scripts/qos2_example_script.sh) |
| mdtest, shared directory, creates   |    [`mdtest 1.e`](README.mdtest.N10.md#ii-required-runs) |    write IOPS |     [`qos3_example_script.sh`](QoS_scripts/qos3_example_script.sh) |

# II. Running the QSS Only Benchmarks

For each of the test workloads, there is an annotated Slurm batch script in the
[`QoS_Scripts`](Qos_Scripts) directory.  Each script has marked where offeror
should, if possible, insert commands to set and unset QoS settings.


# IV. Results

Offeror will provide documentation and relevant details about how QoS was set 
to achieve results.  Additional details about offeror's QoS mechanism(s) are 
welcome.  Offeror must provide all results from ior and mdtest for each job run 
for the above tests.

