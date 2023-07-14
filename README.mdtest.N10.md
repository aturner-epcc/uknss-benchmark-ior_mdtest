NERSC-10 mdtest Benchmark
================================================================================

# I. Run Rules
--------------------------------------------------------------------------------

This benchmark is intended to measure the metadata capability of both
the platform storage system and the QoS storage system.  It measures
the rate at which a filesystem can create, state, and delete files,
and contains features that minimize caching/buffering effects.  As
such, the Offerer should not utilize optimizations that cache/buffer
file metadata or metadata operations in compute node memory.

Observed benchmark performance shall be obtained from a storage system
configured as closely as possible to the proposed platform storage. If
the proposed solution includes multiple file access protocols (e.g.,
pNFS and NFS) or multiple tiers accessible by applications, benchmark
results for mdtest shall be provided for each protocol and/or tier.

Performance projections are permissible if they are derived from a similar
system that is considered an earlier generation of the proposed system.

The Offeror shall run both of the following tests for each of the listed
levels of concurrency. 

## 1. create, stat, and remove at least 1,048,576 files in a single directory
   
   a) a single MPI process (perform a separate test for CPU and for GPU)
   b) the optimal number of MPI processes on a single CPU compute node
   c) the optimal number of MPI processes on a single GPU compute node
   d) the minimal number of MPI processes on multiple compute nodes that achieves the peak results for the proposed system
   e) the maximum possible MPI-level concurrency on the proposed system.  This could mean:
   * using one MPI process per CPU core across the entire system
   * using the maximum number of MPI processes possible if one MPI process per
     core will not be possible on the proposed architecture
   * using more than 1,048,576 files if the system is capable of launching
     more than 1,048,576 MPI processes


## 2. create, stat, and remove at least 1,048,576 files in separate directories, assigning one directory per MPI process.

Tests must be run at the following levels of concurrency:

1. a single MPI process (perform a separate test for CPU and for GPU)
2. the optimal number of MPI processes on a single compute node
   (perform a separate test for CPU and for GPU)
3. the minimal number of MPI processes on multiple compute nodes that achieves
   the peak results for the proposed system
4. the maximum possible MPI-level concurrency on the proposed system.  This
   could mean
   * using one MPI process per CPU/GPU core across the entire system
   * using the maximum number of MPI processes possible if one MPI process per
     core will not be possible on the proposed architecture
   * using more than 1,048,576 files if the system is capable of launching
     more than 1,048,576 MPI processes

These tests are configured via command-line arguments, and the
following section provides guidance on passing the correct options to
`mdtest` for each test.


# II. Running mdtest
--------------------------------------------------------------------------------

mdtest is executed as any other standard MPI application would be on the
proposed system (e.g., with `mpirun` or `srun`).  For the sake of the
following examples, `mpirun` is used.

**To run create, stat, and delete tests on files in a shared directory**, an
appropriate `mdtest` command-line invocation may look like

    mpirun -np 64 ./mdtest -F -C -T -r -n 16384 -d /scratch -N 16

### The following command-line flags MUST be changed:

* `-n` - the number of files **each MPI process** should manipulate.  For a
  test run with 64 MPI processes, specifying `-n 16384` will produce the
  required 1048576 files (64 MPI processes x 16384).  This parameter must
  be changed for each level of concurrency.
* `-d /scratch` - the directory in which this test should be run.  **This
  must be an absolute path.**
* `-N` - MPI rank offset for each separate phase of the test.  This parameter
  must be equal to the number of MPI processes per node in use (e.g., `-N 16`
  for a test with 16 processes per node) to ensure that each test phase (read,
  stat, and delete) is performed on a different node.

### The following command-line flags MUST NOT be changed or omitted:

* `-F` - only operate on files, not directories
* `-C` - perform file creation test
* `-T` - perform file stat test
* `-r` - perform file remove test

**To run mdtest where each MPI process acts on its own directory**,
an appropriate `mdtest` command-line invocation will add the `-u` option:

    mpirun -np 64 ./mdtest -F -C -T -r -n 16384 -d /scratch -N 16 -u


# III. Reporting Results
--------------------------------------------------------------------------------

mdtest will execute file creation, file statting, and file deletion tests for
each run.  The rate of file creating/statting/deleting are reported to stdout
at the conclusion of each test, and the following rates should be reported:

* `File creation`
* `File stat`
* `File removal`

The maximum values for these rates must be reported for all tests.  Reporting
the maximum creation rates from one run and the maximum deletion rates from a
different run is NOT valid.  File creation rate has slightly higher importance
for this test, so if the highest observed file creation rate came from a
different run than the highest observed deletion rate, report the results from
the run with the highest file creation rate.
