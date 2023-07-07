This repository describes the Storage Microbenchmarks
from the [NERSC-10 (N10) Workflow benchmark suite](https://www.nersc.gov/systems/nersc-10/benchmarks). <br>
The [N10 benchmark run rules](https://gitlab.com/NERSC/N10-benchmarks/run-rules-and-ssi/-/blob/main/N10_Benchmark_RunRules.pdf) 
should be reviewed before running these benchmark.<br>


# 0. Storage Microbenchmarks Overview

The storage microbenchmarks are intended to measure the performance of the proposed platform storage system (PSS) and quality of service storage system (QSS).

IOR will be used to measure parallel I/O performance using both the POSIX and MPI-IO apis.  The specifics of the IOR tests to be performed are in the file called:

`README.ior.N10`

with helper scripts in the file called:

`inputs.N10`

mdtest will be used to measure the performance of various metadata operations using MPI to execute the operations and collect the results.  The specifics of the mdtest tests to be run are in the file called:

`README.mdtest.N10`

Both IOR and mdtest will be employed to measure the performance of 
the quality of service capability of the QoS Storage System.  Both ior and 
mdtest will be employed to demonstrate QoS.  The specifics of the QoS tests are in the file called:

`README.QoS.N10`

# 1. Permitted Modifications

Modifications to the benchmark application code are only permissible to enable
correct compilation and execution on the target platform.  Any modifications
must be fully documented (e.g., as a diff or patch file) and reported with the
benchmark results.


# 2. Installing IOR and mdtest

MPI and MPI-IO are required to build and run the codes. The
source code used for this benchmark is derived from IOR 3.3.0 and it is
included here.  More information about IOR is available at
https://github.com/hpc/ior.

After extracting the tar file, ensure that the MPI compiler wrappers (e.g.,
`mpicc`) are in `$PATH` and then

    cd ior-3.3.0
    ./configure
    make

This will build both IOR with the POSIX and MPI-IO interfaces and create the
IOR executable at `src/ior`.  It will also build mdtest and place the
executable at `src/mdtest`.


# 4. Reporting Results


### Benchmark Platform Description

The Offeror must provide a comprehensive description of the environment in which
each benchmark was run.  This must include:

* Client and server system configurations, including node and processor counts,
  processor models, memory size and speed, and OS (names and versions)
* Storage media and their configurations used for each tier of the storage
  subsystem
* Network fabric used to connect servers, clients, and storage, including
  network configuration settings and topology
* Client and server configuration settings including
    * Client and server sysctl settings
    * Driver options
    * Network interface options
    * File system configuration and mount options
* Compiler name and version, compiler options, and libraries used to build
  benchmarks
