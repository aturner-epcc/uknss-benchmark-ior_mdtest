NERSC-10 QSS Only Benchmarks
================

The intent of these benchmark is to demonstrate and measure the
effectiveness of the quality of service feature of the QoS storage
systems.
The QoS tests are required only for the QSS.


# I. Run Rules
--------------------------------------------------------------------------------

Observed benchmark performance shall be obtained from a storage system
configured as closely as possible to the proposed QoS storage.

For the purposes of this test, the use of a scalable unit or subset of
the proposed scalable units is allowed.

The building blocks for these tests are IOR and mdtest runs which are
described in [`README.ior.N10.md`](README.ior.N10.md) and [`README.mdtest.N10.md`](README.mdtest.N10.md).


# II. Running the QSS Only Benchmarks
--------------------------------------------------------------------------------

For each of the below tests, there is an annotated Slurm batch script in the
[`QoS_Scripts`](Qos_Scripts) directory.  Each script has marked where offeror
should, if possible, insert commands to set and unset QoS settings.


# III. Required Runs
--------------------------------------------------------------------------------

There are three QoS tests and the steps for each are the same, only the base test
to be run and the type of QoS employed (bandwidth or IOPs) change.

1. IOR, sequential, N to N, reads and writes - base test: `IOR test 1.d` - QoS: `read and write Bandwidth`
2. IOR, random, small-transaction, N to N, reads and writes - base test: `IOR test 3.d` - QoS: `read and write IOPs`
3. mdtest, shared directory, creates - base test: `mdtest 1.e` - QoS: `write IOPs`

- *a.* Run the base test with sufficient compute nodes to achieve maximum result on the filesystem or subset of the filesystem.  
            - For test 1, record the read and write bandwidth in the output, use 20% of these values for read and write bandwidth QoS.
            - For test 2, record the read and write IOPs in the output, use 20% of these values for read and write IOPs QoS.  
            - For test 3, record file creates, stats, and removes, use 20% of creates for write IOPs QoS.
- *b.* For job counts of 1, 2, 3, 4, and 5, run independent identical jobs simulteneously using the provided QoS mechanism to set QoS for each job to the 20% values determined above. 
- *c.* Record the output for each test.
- *e.* Remove the QoS setting

# IV. Results
--------------------------------------------------------------------------------

Offeror will provide documentation and relevant details about how QoS was set 
to achieve results.  Additional details about offeror's QoS mechanism(s) are 
welcome.  Offeror must provide all results from ior and mdtest for each job run 
for the above tests.

