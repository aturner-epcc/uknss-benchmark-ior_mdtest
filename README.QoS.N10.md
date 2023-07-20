NERSC-10 QSS Only Benchmark
================

The intent of these benchmark is to demonstrate and measure the
effectiveness of the quality of service feature of the QoS storage
systems.

# I. Run Rules
--------------------------------------------------------------------------------

Observed benchmark performance shall be obtained from a storage system
configured as closely as possible to the proposed QoS storage.

For the purposes of this test, the use of a scalable unit or subset of
the proposed scalable units is allowed.

The building blocks for these tests are IOR and mdtest runs which are
described in [`README.ior.N10.md`](README.ior.N10.md) and [`README.mdtest.N10.md`](README.mdtest.N10.md).

For each of the below tests, there is an annotated Slurm batch script in the
[`QoS_Scripts`](Qos_Scripts) directory.  Each script has marked where offeror
should, if possible, insert commands to set and unset QoS settings.

# II. Required Runs
--------------------------------------------------------------------------------

1. IOR, sequential, N to N, reads and writes

     - *a.* Run the IOR test 1d), sufficient compute nodes to achieve maximum 
          result on the filesystem or subset of the filesystem. Record the read 
          and write bandwidth in the output.
    - *b.* Using the provided QoS mechanism, set the read and write 
          bandwidth QoS for the job to 20% of the values recorded.
    - *c.* Rerun the test with this QoS setting and record the read and 
          write bandwidth in the output.
    - *d.* For job counts of 2, 3, 4, and 5. Run independent jobs like 1a, 
          above, simulteneously where the read and write bandwidth QoS for each 
          job is set to the same 20% value used for 1c. Record read and write 
          bandwidth for each job.
    - *e.* Remove the QoS setting


2. IOR, random, small-transaction, N to N, reads and writes

     - *a.* Run the IOR test 3d), sufficient compute nodes to achieve 
        maximum result on the filesystem or subset of the filesystem. 
        Record the read and write IOPs in the output.
    - *b.* Using the provided QoS mechanism, set the read and write IOPs QoS 
        for the job to 20% of the values recorded.
    - *c.* Rerun the test with this QoS setting and record the read and 
        write IOPs.
    - *d.* For job counts of 2, 3, 4, and 5. Run independent jobs like 2a, 
          above, simulteneously where the read and write IOPs QoS for each job 
          is set to the same 20% value used for 2c. Record read and write IOPs 
          for each job.
    - *e.* Remove the QoS setting


3. mdtest, shared directory, creates 

     - *a.* Run mdtest 3e), sufficient MPI processes to achieve maximum result 
        on the filesystem or subset of the filesystem. Record the create, stat, 
        and remove operations per second in the output.
    - *b.* Using the provided QoS mechanism, set the write IOPs QoS to 20% of 
        the creates per second value recorded.
    - *c.* Rerun the test with this QoS setting and record the results.
    - *d.* For job counts of 2, 3, 4, and 5. Run independent jobs like 3a, 
          above, simulteneously where the write IOPs QoS for each job is set to 
          the same 20% value used for 3c. Record read and write IOPs for each 
          job.
    - *e.* Remove the QoS setting


# III. Results
--------------------------------------------------------------------------------

Offeror will provide documentation and relevant details about how QoS was set 
to achieve results.  Additional details about offeror's QoS mechanism(s) are 
welcome.  Offeror must provide all results from ior and mdtest for each job run 
for the above tests.

