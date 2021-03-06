#!/bin/bash
sudo find ./build/cache/toolchains/ -name *.aria2 -type f -delete
sudo find ./build/cache/toolchains/ -name *.tar.xz -type f -delete
sudo find ./cache/toolchains/ -type f -exec ln {} ./build/cache/toolchains/ \;

#git config --global http.https://github.com.proxy socks5h://192.168.1.16:1081
cd "$(dirname "$(find /home/mei/armbian -name 'compile.sh' -type f)")" && sudo git checkout master || exit 1
env ALL_PROXY=socks5h://192.168.1.16:1081 ./compile.sh KERNEL_CONFIGURE=no KERNEL_KEEP_CONFIG=no BUILD_DESKTOP=no \
    BRANCH=dev RELEASE=disco KERNEL_ONLY=no BOARD=orangepilite2 BTRFS_COMPRESSION=zstd DOWNLOAD_MIRROR=china \
    INSTALL_HEADERS=yes BUILD_KSRC=no ROOTFS_TYPE=btrfs LIB_TAG=works 
# branch works

# git config --global --unset http.https://github.com.proxy
