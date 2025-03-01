#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.12/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile

sed -i '/openwrt-23.05/d' feeds.conf.default
sed -i 's/^#\(.*luci\)/\1/' feeds.conf.default
# sed -i '2i src-git luci https://github.com/coolsnowwolf/luci.git' feeds.conf.default


function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}

rm -rf package/custom; mkdir package/custom

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# git clone https://github.com/linkease/istore.git package/luci-app-store
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/rrkai/luci-app-vssr.git package/luci-app-vssr
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon-18.06
git clone https://github.com/kenzok78/luci-app-fileassistant.git package/luci-app-fileassistant
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
git clone https://github.com/rrkai/luci-app-eqosplus package/luci-app-eqosplus
git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash
# sed -i '$a src-git bypass https://github.com/garypang13/openwrt-bypass' feeds.conf.default
# mv -vf ../mt7621_phicomm_k2p.dts ./target/linux/ramips/dts/mt7621_phicomm_k2p.dts
# svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
# svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
# sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile
# svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
# git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# git clone https://github.com/kiddin9/openwrt-bypass.git package/openwrt-bypass
# git clone -b luci https://github.com/xiaorouji/openwrt-passwall package/passwall
# git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
# git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
# git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
# git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray
