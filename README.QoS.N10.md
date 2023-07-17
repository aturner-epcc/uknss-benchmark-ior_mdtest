NERSC-10 QSS Only Benchmark
================================================================================

# I. Run Rules
--------------------------------------------------------------------------------

The intent of this benchmark is to demonstrate and measure the
performance of the quality of service capability of the QoS storage
systems.

Observed benchmark performance shall be obtained from a storage system
configured as closely as possible to the proposed platform storage.

For the purposes of this test, the use of a scalable unit or subset of
the proposed scalable units is allowed.

The building blocks for these tests are IOR and mdtest runs which are
described in README.ior.N10.md and README.mdtest.N10.md.

### Required Runs

## 1) QoS Resource Division Scaling Test:

    a) IOR, sequential, N to N, reads and writes

        * Run the IOR test 1d), sufficient compute nodes to achieve
      maximum result on the filesystem or subset of the
      filesystem. Record the read and write bandwidth in the output.

        * Using the provided QoS mechanism, set the read and write
      bandwidth QoS for the job to 20% of the values recorded.

        * Rerun the test with this QoS setting and record the results.

	* 

        * Remove the QoS setting
<br>

    b) IOR, random, small-transaction, N to N, reads and writes

	* Run the IOR test 3d), sufficient compute nodes to achieve
      maximum result on the filesystem or subset of the
      filesystem. Record the read and write IOPs in the output.

	* Using the provided QoS mechanism, set the read and write
      IOPs QoS for the job to 20% of the values recorded.

	* Rerun the test with this QoS setting and record the results.

	*

	* Remove the QoS setting
<br>

    c) limit mdtest create results

        * Run mdtest 3e), sufficient MPI processes to achieve maximum
      result on the filesystem or subset of the filesystem. Record the
      create, stat, and remove operations per second in the output.

        * Using the provided QoS mechanism, set the write IOPs QoS to
          20% of the creates per second value recorded.

        * Rerun the test with this QoS setting and record the results.

        * Remove the QoS setting

# III. Reporting Results
--------------------------------------------------------------------------------

Offeror will articulate results for ior and mdtest for each client

