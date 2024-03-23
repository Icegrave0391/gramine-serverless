#!/bin/bash

# See https://github.com/gramineproject/gramine/issues/1224 to collectly make the sgx_driver

pushd gramine/
	meson setup build/ --buildtype=release -Ddirect=enabled -Dsgx=enabled \
    			-Dsgx_driver=upstream
popd
