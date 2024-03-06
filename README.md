# OpenWrt X86_64 自用版云编译项目

## 固件来源：

P3TERX云编译脚本地址：[https://github.com/P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

lean固件源码地址：[https://github.com/coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)

云编译脚本借鉴：[https://github.com/firkerword/openwrt-Exclusive](https://github.com/firkerword/openwrt-Exclusive)

## 固件说明：
功能介绍：自用稳定版  分为带ipv6和不带ipv6版本,其他的均一样.

注意!:2024年1月1日开始只编译ipv6版本,不需要的可以单独卸载掉(最新的docker必须依赖IPV6,如果卸载了会同步卸载docker)

编译源码为LEDE的5.10和6.6内核最新版,5.10和6.6内核都为超长期稳定（SLTS）内核.

由衷感谢所有为openwrt无私奉献的大佬们

自带插件列为:Docker,HelloWorld,ShadowSocksR++,全能推送,WatchCat,网络唤醒,动态DNS,UPnP,TurboACC网络加速,NFT-QOS网速控制,带宽监控,TTYD,定时重启

固件解压后大小控制在800M内,方便小硬盘安装,软件包剩余空间大于200M,方便自己安装插件.

> `默认ip：192.168.1.1 密码：password`
