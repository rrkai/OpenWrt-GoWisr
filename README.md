# OpenWrt X86_64 自用版云编译项目

## 固件来源：

P3TERX云编译脚本地址：[https://github.com/P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

lean固件源码地址：[https://github.com/coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)

云编译脚本借鉴：[https://github.com/firkerword/openwrt-Exclusive](https://github.com/firkerword/openwrt-Exclusive)

## 固件说明：
功能介绍：自用稳定版  分为带ipv6和不带ipv6版本,其他的均一样.
~~注意!:2024年1月1日开始只编译ipv6版本,不需要的可以单独卸载掉(最新的docker必须依赖IPV6,如果卸载了会同步卸载docker)~~

编译源码为LEDE的6.6和6.1内核最新版,6.6和6.1内核都为超长期稳定（LTS）内核.

**2025.03.17更新记录**
去除5.10内核,后续应该不会增加.
增加6.6内核,以后主要为6.1和6.6内核两个版本.
去除SSR PLUS+,经过测试,跟固件有莫名其妙的规则冲突,无法解决,彻底去除.
增加passwall,OpenClash,多2个选择.易用程度vssr＞passwall＞OpenClash.
重新恢复mini版本,特点是彻底去除ipv6,缺点是docker也没办法用.
ACC网络加速只保留Flow,经过测试,在X86机器上.Flow性能和BUG远低于SFE.

由衷感谢所有为openwrt无私奉献的大佬们

**自带插件列表可以在[releases](https://github.com/rrkai/OpenWrt-Liao/releases)查看.**

固件解压后大小控制在500M内,方便小硬盘安装,软件包剩余空间大于200M,方便自己安装插件.

> `默认ip：192.168.1.1 密码：password`
