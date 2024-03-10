#!/bin/bash
source .env

CURDIR=$(pwd)
HOSTFS="$CURDIR/sharefs"

DOCKFS="/share"

img_exists=$(docker image ls | grep "$DOCKERIMG" | awk '{print $1}')
if [[ -z "$img_exists" ]]; then
	echo "Please run ./dockerbuild.sh first!"
	exit
fi

docker run\
	--security-opt seccomp=unconfined \
	--device /dev/sgx_enclave	\
	--device /dev/sgx_provision	\
	-v $HOSTFS:$DOCKFS		\
	-it $DOCKERIMG
