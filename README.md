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

After this, a prompt inside the container environment will pop up.

3. Execute workloads.

Refer to [sharefs/nodejs-gramine](sharefs/nodejs-gramine).
