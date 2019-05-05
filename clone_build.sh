#!/bin/bash
env ALL_PROXY=socks5h://192.168.1.16:1081 git clone --depth 100 --branch master https://github.com/armbian/build.git
