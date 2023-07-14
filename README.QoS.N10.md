NERSC-10 QSS Only Benchmarks
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

## 1) Rate limit test:

    a) limit bandwidth of sequential, N to N, reads and writes

        * Either from a fresh or completed run of IOR test 1a), single
      CPU sequential N-N, record the read and write bandwidth in the
      output.

        * Using the provided QoS mechanism, set the read and write
      bandwidth QoS to half of the values recorded.

        * Rerun the test with this QoS setting and record the results.

        * Remove the QoS setting
<br>

    b) limit IOPs of random, small-transaction, N to N, reads and writes

        * Either from a fresh or completed run of IOR test 3a), single
      CPU random N-N, record the read and write bandwidth in the
      output.

        * Using the provided QoS mechanism, set the read and write
      IOPs QoS to half of the values recorded.

        * Rerun the test with this QoS setting and record the results.

        * Remove the QoS setting    
<br>

    c) limit mdtest create results

        * Either from a fresh or completed run of mdtest 1a), single
  MPI process on a CPU, record the file create operations per second.

        * Using the provided QoS mechanism, set the write IOPs QoS to
  half of the value recorded.

        * Rerun the test with this QoS setting and record the results.

        * Remove the QoS setting

## 2) Resource division test:

Run an IOR job of arbitrary size
take resulting IOPs
divide by 5
assign result to QoS for 5 separate simultaneous jobs

1) show that N multi-client ior jobs, run on an otherwise empty system,
each granted the same QoS, will achieve the same result. Begin with N=1
and increase up to, and beyond the point the storage system is saturated. 

2) show that N multi-client ior jobs, run on an otherwise empty system,
each granted the same QoS, will achieve the same result. Begin with N=1
and increase up to, and beyond the point the storage system is saturated.


# III. Reporting Results
--------------------------------------------------------------------------------

Offeror will articulate results for ior and mdtest for each client



