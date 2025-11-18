sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.12/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
sed -i '/openwrt-24.10/d' feeds.conf.default

# function merge_package(){ ... }
# function drop_package(){ ... }

# rm -rf package/custom; mkdir package/custom # 这行可以保留，但此时 custom 目录是空的

# Add a feed source
# ... 注释掉所有 git clone 命令 ...
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git      package/luci-theme-argon-18.06
# git clone https://github.com/jerrykuku/lua-maxminddb.git     package/lua-maxminddb
# git clone https://github.com/rrkai/luci-app-vssr.git     package/luci-app-vssr
# git clone https://github.com/kenzok78/luci-app-fileassistant.git     package/luci-app-fileassistant
# git clone https://github.com/zzsj0928/luci-app-pushbot     package/luci-app-pushbot
# git clone https://github.com/rrkai/luci-app-eqosplus     package/luci-app-eqosplus
# git clone https://github.com/xiaorouji/openwrt-passwall-packages.git     package/openwrt-passwall
# git clone https://github.com/xiaorouji/openwrt-passwall.git     package/passwall
# git clone https://github.com/vernesong/OpenClash.git   package/luci-app-openclash
# git clone https://github.com/sbwml/v2ray-geodata   package/v2ray-geodata

# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
