## Gramine-serverless

This repo is to test the performance overhead of using SGX & libOS ([gramine](https://github.com/gramineproject/gramine)) under certain serverless workload benchmarks.

### Setup

1. Create a customized local docker image based on `gramineproject/gramine` and required package dependencies.

```bash
./dockerbuild.sh
```

2. Start the docker container environment.

```bash
./dockerstart.sh
```

After this, a prompt inside the container environment at `/share` will pop up.

3. Execute workloads.

Inside the container, please enter `/share/nodejs-gramine`. 

**(MUST DO!) Build gramine-enabled nodejs.**
First, we build the manifest of gramine libOS-enabled nodejs.
```bash
cd /share/nodejs-gramine
./build-all.sh
```

**Ad-hoc workload execution.**
Then, we execute workload in the following different mode:

```bash
cd /share/nodejs-gramine

# Native execution
nodejs /share/nodejs-gramine/benchmarks/xxx.js

# Gramine-direct execution (w/o SGX enclave)
gramine-direct nodejs /share/nodejs-gramine/benchmarks/xxx.js

# Gramine-sgx execution (w/ SGX enclave)
gramine-sgx nodejs /share/nodejs-gramine/benchmarks/xxx.js
```

*Note:* Please use the absoluate path of `/share/nodejs-gramine/benchmarks/xxx.js` inside container for `gramine` to execute the js workloads.

**Benchmark test.**
We can directly use my provided benchmark to get runtime performance and memory (unsupported yet) overheads.

```bash
cd /share/nodejs-gramine
# get runtime performance overhead
# after execution, results will be at /share/nodejs-gramine/outputs/bench-overhead.txt
./run-overhead.sh

# get memory overhead
# after execution, results will be at /share/nodejs-gramine/outputs/bench-memory.txt
# unsupported yet.
```
