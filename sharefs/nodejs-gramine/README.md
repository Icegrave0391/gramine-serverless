## Execute the workload

First of all, run `./build-all.sh` to build the gramine lib-OS enabled `nodejs`.

Then, execute workload in the following different mode:

+ Native: `nodejs /share/nodejs-gramine/benchmarks/xxx.js`.
+ gramine-direct: `gramine-direct nodejs /share/nodejs-gramine/benchmarks/xxx.js`.
+ gramine-sgx: `gramine-sgx nodejs /share/nodejs-gramine/benchmarks/xxx.js`.

**Note:** Please use the absoluate path of `/share/nodejs-gramine/benchmarks/xxx.js` for `gramine`.
