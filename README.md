This repository describes the Storage Microbenchmarks
from the [NERSC-10 (N10) Workflow benchmark suite](https://www.nersc.gov/systems/nersc-10/benchmarks). <br>
The [N10 benchmark run rules](https://gitlab.com/NERSC/N10-benchmarks/run-rules-and-ssi/-/blob/main/N10_Benchmark_RunRules.pdf) 
should be reviewed before running these benchmark.<br>


# 0. Storage Microbenchmarks Overview



# 1. Permitted Modifications

Modifications to the benchmark application code are only permissible to enable
correct compilation and execution on the target platform.  Any modifications
must be fully documented (e.g., as a diff or patch file) and reported with the
benchmark results.


# 2. Installing IOR and mdtest





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
