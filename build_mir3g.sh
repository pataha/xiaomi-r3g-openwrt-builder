#!/bin/bash

RELEASE_NAME=v0.1-$(date +%Y%m%d_%H%M%S)
INCLUDED_PACKAGES="luci mt7603 uci2dat wificonf mtk-nvram mtk-luci-plugin"
EXCLUDED_PACKAGES="-wpad-mini -kmod-cfg80211 -kmod-mac80211 -kmod-mt76-core -kmod-mt7603 -kmod-mt76x2"

echo "Begin build ${RELEASE_NAME} with modules ${RELEASE_MODULES}"
  
wget https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
tar -xvf openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz >/dev/null
rm -f openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
cd openwrt-imagebuilder-ramips-mt7621.Linux-x86_64

# add MTK driver
echo "src-git mtk https://github.com/Nossiac/mtk-openwrt-feeds;master" >> feeds.conf.default
scripts/feeds update -f mtk
scripts/feeds install -a -p mtk

make image PROFILE=mir3g "PACKAGES=${INCLUDED_PACKAGES} ${EXCLUDED_PACKAGES}"

if [ $? -eq 0 ]; then
  echo "Build has been complete successful"
else
  echo "Build has been failed"
  exit 2
fi
