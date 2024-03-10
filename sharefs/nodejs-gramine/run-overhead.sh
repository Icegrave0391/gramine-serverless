#!/bin/bash

BENCHMARK_DIR=/share/nodejs-gramine/benchmarks

OUTPUT_FILE=/share/nodejs-gramine/outputs/bench-overhead.txt

echo "" > $OUTPUT_FILE
for js_file in $BENCHMARK_DIR/*.js; do
    echo "===> Benchmarking $js_file..."
    # execute native
    echo "*********** $js_file ***********" >> $OUTPUT_FILE
    start_time=$(date +%s%N)
    nodejs $js_file > /dev/null 2>&1
    end_time=$(date +%s%N)
    elapsed=$(( (end_time - start_time) / 1000000 ))
    echo "Native: $elapsed ms" >> $OUTPUT_FILE
    # execute gramine-direct
    start_time=$(date +%s%N)
    gramine-direct nodejs $js_file > /dev/null 2>&1
    end_time=$(date +%s%N)
    elapsed=$(( (end_time - start_time) / 1000000 ))
    echo "Gramine-direct: $elapsed ms" >> $OUTPUT_FILE
    # execute gramine-sgx
    start_time=$(date +%s%N)
    gramine-sgx nodejs $js_file > /dev/null 2>&1
    end_time=$(date +%s%N)
    elapsed=$(( (end_time - start_time) / 1000000 ))
    echo "Gramine-sgx: $elapsed ms" >> $OUTPUT_FILE
done

