#!/bin/bash
CWD=/home/mei/armbian/build/cache/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu
export PATH="$CWD:$PATH"
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
pushd .
cd /home/mei/armbian/build/cache/sources/linux-mainline/orange-pi-5.1
make -j8 Image
make -j8 dtbs
popd
