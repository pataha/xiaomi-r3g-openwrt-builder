#!/bin/bash

RELEASE_NAME=v0.1-$(date +%Y%m%d_%H%M%S)
RELEASE_MODULES="luci"

echo "Begin build ${RELEASE_NAME} with modules ${RELEASE_MODULES}"
	
wget https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
tar -xvf openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz >/dev/null
rm -f openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
cd openwrt-imagebuilder-ramips-mt7621.Linux-x86_64
make image PROFILE=mir3g "PACKAGES=${RELEASE_MODULES}"

if [ $? -eq 0 ]; then
	echo "Build has been complete successful"
else
	echo "Build has been failed"
	exit 2
fi
