#!/bin/bash
CWD=/home/mei/armbian/build/cache/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu
export PATH="$CWD/bin:$PATH"
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
pushd .
cd /home/mei/armbian/build/cache/sources/linux-mainline/orange-pi-5.1
#git checkout origin/orange-pi-5.1 -f
## git am /home/mei/armbian/build/patch/kernel/sunxi-dev/*.patch
#/bin/ls /home/mei/armbian/build/patch/kernel/sunxi-dev/*.patch|xargs -0 git apply
# make clean dtbs
make dtbs V=s
# make Image V=s
popd
