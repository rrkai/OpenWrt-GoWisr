#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.12/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
sed -i '/openwrt-24.10/d' feeds.conf.default
sed -i 's/^#\(.*luci\)/\1/' feeds.conf.default

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
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon-18.06
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/rrkai/luci-app-vssr.git package/luci-app-vssr
git clone https://github.com/kenzok78/luci-app-fileassistant.git package/luci-app-fileassistant
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
git clone https://github.com/rrkai/luci-app-eqosplus package/luci-app-eqosplus
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
# svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
# svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
# git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
# git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
# git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
