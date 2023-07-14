NERSC-10 QSS Only Benchmarks
================================================================================

# I. Run Rules
--------------------------------------------------------------------------------

The intent of this benchmark is to demonstrate and measure the performance 
of the quality of service capability of the QoS storage systems.  

Observed benchmark performance shall be obtained from a storage system
configured as closely as possible to the proposed platform storage. 

For the purposes of this test, the use of a scalable unit or subset of
the proposed scalable units is allowed.

### Required Runs

Using the operating instructions layed out in README.ior.N10 and
README.mdtest.N10:

## 1) Rate limit test:

    a) IOPs result from strided single client CPU

take IOPs from IOR or bandwidth - set QoS to half of that and re-run

    b) IOPs result from random single client CPU

take IOPs from IOR or bandwidth - set QoS to half of that and re-run

    c) IOPs result from mdtest create

take IOPs from create - set Qos to half and re-run

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



