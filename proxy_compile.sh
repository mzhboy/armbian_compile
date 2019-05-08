#!/bin/bash
sudo find ./build/cache/toolchains/ -name *.aria2 -type f -delete
sudo find ./build/cache/toolchains/ -name *.tar.xz -type f -delete
sudo find ./cache/toolchains/ -type f -exec ln {} ./build/cache/toolchains/ \;

#sudo git config --global http.https://github.com.proxy socks5h://192.168.1.16:1081
sudo git config --global http.https://git.kernel.org.proxy socks5h://192.168.1.16:1081

cd "$(dirname "$(find /home/mei/ -name 'compile.sh' -type f)")" && sudo git checkout master || exit 1
env ALL_PROXY=socks5h://192.168.1.16:1081 ./compile.sh KERNEL_CONFIGURE=no KERNEL_KEEP_CONFIG=no BUILD_DESKTOP=no \
    BRANCH=dev RELEASE=stretch KERNEL_ONLY=no BOARD=orangepilite2 \
    BUILD_KSRC=no ROOTFS_TYPE=btrfs LIB_TAG=works 
# branch works

# sudo git config --global --unset http.https://github.com.proxy

