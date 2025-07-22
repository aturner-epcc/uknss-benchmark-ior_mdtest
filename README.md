#  Storage micro-benchmark

**Note:** This benchmark/repository is closely based on the one used for the [NERSC-10 benchmarks](https://www.nersc.gov/systems/nersc-10/benchmarks/)

The storage microbenchmarks are intended to measure the performance of storage systems.

## Status

Stable

## Maintainers

[@aturner-epcc](https://github.com/aturner-epcc)

## Overview

### Software

MPI and MPI-IO are required to build and run the codes. The source code used for this benchmark is derived from IOR 3.3.0 and it is included here.  More information about IOR is available at https://github.com/hpc/ior.

### Architectures

- CPU: x86, Arm
- GPU: NVIDIA, AMD, Intel

### Languages and programming models

- Programming languages: C
- Parallel models: MPI
- Accelerator offload models: CUDA, ROCm

## Building the benchmark

At the moment, only manual build instructions are available. We plan to add Spack
build instructions in the future.

### Permitted modifications

Modifications to the benchmark application code are only permissible to enable
correct compilation and execution on the target platform.
Any modifications must be fully documented (e.g., as a diff or patch file)
and reported with the benchmark results.

### Manual build

MPI and MPI-IO are required to build and run the codes.

After extracting the tar file, ensure that the MPI compiler wrappers (e.g.,
`mpicc`) are in `$PATH` and then

    cd ior-3.3.0
    ./configure
    make

This will build both IOR with the POSIX and MPI-IO interfaces and create the
IOR executable at `src/ior`.  It will also build mdtest and place the
executable at `src/mdtest`.

## Running the benchmark

At the moment, only manual run instructions are available.

### Required Tests

To complete the entire benchmark, three sets of measurments are required:

- IOR will be used to measure parallel I/O performance using both the POSIX and MPI-IO APIs. The specifics of the IOR tests to be performed are in the file named [`README.ior.N10.md`](README.ior.N10.md).
- For both storage systems, mdtest will be used to measure the performance of various metadata operations using MPI to execute the operations and collect the results. The specifics of the mdtest tests to be run are in the file named [`README.mdtest.N10.md`](README.mdtest.N10.md).
- For only the QSS, IOR and mdtest will be employed to measure the performance of
the system's quality of service capability.  The specifics of the QoS tests are in the file named
[`README.QoS.N10.md`](README.QoS.N10.md).

## Reporting results

### Benchmark platform description

The Offeror must provide a comprehensive description of the environment in which
each benchmark was run.  This must include:

- Client and server system configurations, including node and processor counts,
  processor models, memory size and speed, and OS (names and versions)
- Storage media and their configurations used for each tier of the storage
  subsystem
- Network fabric used to connect servers, clients, and storage, including
  network configuration settings and topology
- Client and server configuration settings including
    * Client and server sysctl settings
    * Driver options
    * Network interface options
    * File system configuration and mount options
- Compiler name and version, compiler options, and libraries used to build
  benchmarks
- Include all the source and makefiles used to build on the target platform and input files and runscripts
- Include all standard output files.

### Performance data

The required measurements are described in the files
[README.ior.N10.md](README.ior.N10.md),
[README.mdtest.N10.md](README.mdtest.N10.md) and
[README.QoS.N10.md](README.QoS.N10.md).


