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

# 	echo "Begin upload the release: $RELEASE_NAME"

# 	github-release release \
# 		--user trinhpham \
# 		--repo xiaomi-r3g-openwrt-builder \
# 		--tag $RELEASE_NAME \
# 		--name $RELEASE_NAME \
# 		--description "CI build includes: ${RELEASE_MODULES}"
		
# 	github-release upload \
# 		--user trinhpham \
# 		--repo xiaomi-r3g-openwrt-builder \
# 		--tag $RELEASE_NAME \
# 		--name openwrt-ramips-mt7621-device-mir3g.manifest \
# 		--file /src/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64/bin/targets/ramips/mt7621/openwrt-ramips-mt7621-device-mir3g.manifest
		
# 	github-release upload \
# 		--user trinhpham \
# 		--repo xiaomi-r3g-openwrt-builder \
# 		--tag $RELEASE_NAME \
# 		--name openwrt-ramips-mt7621-mir3g-squashfs-rootfs0.bin \
# 		--file /src/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64/bin/targets/ramips/mt7621/openwrt-ramips-mt7621-mir3g-squashfs-rootfs0.bin
		
# 	github-release upload \
# 		--user trinhpham \
# 		--repo xiaomi-r3g-openwrt-builder \
# 		--tag $RELEASE_NAME \
# 		--name sha256sums \
# 		--file /src/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64/bin/targets/ramips/mt7621/sha256sums

# 	github-release upload \
# 		--user trinhpham \
# 		--repo xiaomi-r3g-openwrt-builder \
# 		--tag $RELEASE_NAME \
# 		--name openwrt-ramips-mt7621-mir3g-squashfs-kernel1.bin \
# 		--file /src/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64/bin/targets/ramips/mt7621/openwrt-ramips-mt7621-mir3g-squashfs-kernel1.bin
		
# 	github-release upload \
# 		--user trinhpham \
# 		--repo xiaomi-r3g-openwrt-builder \
# 		--tag $RELEASE_NAME \
# 		--name openwrt-ramips-mt7621-mir3g-squashfs-sysupgrade.tar \
# 		--file /src/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64/bin/targets/ramips/mt7621/openwrt-ramips-mt7621-mir3g-squashfs-sysupgrade.tar
else
	echo "Build has been failed"
	exit 2
fi
