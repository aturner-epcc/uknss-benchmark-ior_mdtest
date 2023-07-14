NERSC-10 QSS Only Benchmarks
================================================================================

# I. Benchmark Description
--------------------------------------------------------------------------------
These benchmarks will use offeror's QoS mechanism in conjunction with IOR and mdtest to demonstrate and measure the performance of 
the quality of service capability of the QoS Storage System.  Both ior and 
mdtest will be employed to demonstrate QoS. All of the general run rules 
for N10 benchmarking apply.

# II. Run Rules
--------------------------------------------------------------------------------
The intent of this benchmark is to demonstrate and measure the performance 
of the quality of service capability of the platform and QoS storage systems.  

Observed benchmark performance shall be obtained from a storage system
configured as closely as possible to the proposed platform storage. 

Use of a scalable unit or subset of the proposed scalable units is allowed
in order to make saturation requirements easier to achieve.

### Required Runs

Using the operating instructions layed out in README.ior.N10 and
README.mdtest.N10:

Rate limit test:

IOPs result from strided single client CPU
IOPs result from random single client CPU
IOPs result from 

Performance division test:



1) show that N multi-client ior jobs, run on an otherwise empty system,
each granted the same QoS, will achieve the same result. Begin with N=1
and increase up to, and beyond the point the storage system is saturated. 

2) show that N multi-client ior jobs, run on an otherwise empty system,
each granted the same QoS, will achieve the same result. Begin with N=1
and increase up to, and beyond the point the storage system is saturated.


# III. Reporting Results
--------------------------------------------------------------------------------

Offeror will articulate results for ior and mdtest for each client



