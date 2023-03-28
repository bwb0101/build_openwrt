#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.28.1/g' package/base-files/files/bin/config_generate

# replace ash to bash
sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd

# replace default banner
rm -rf package/base-files/files/etc/banner
cp $GITHUB_WORKSPACE/data/banner package/base-files/files/etc/banner

# change model info
cp $GITHUB_WORKSPACE/data/model.sh package/base-files/files/etc/
chmod +x package/base-files/files/etc/model.sh

# add IPv6 hotplug(ipv6 nat，现在已有kmod-ipt-nat6模块)
#mkdir -p package/base-files/files/etc/hotplug.d/iface
#cp $GITHUB_WORKSPACE/data/99-ipv6 package/base-files/files/etc/hotplug.d/iface/99-ipv6
#chmod +x package/base-files/files/etc/hotplug.d/iface/99-ipv6

# repleace opkg url
#sed -i 's#https://downloads.openwrt.org#http://192.168.28.2:8184/openwrt#g' /etc/opkg/distfeeds.conf
#sed -i 's#https://downloads.openwrt.org/releases/22.03-SNAPSHOT#http://192.168.28.2:8184/openwrt/snapshots#g' /etc/opkg/distfeeds.conf

# fix versync version 2.10.5 bug
#sed -i 's/2.10.5/2.13.2/g' feeds/lienol/verysync/Makefile

#echo "" >> package/base-files/files/etc/sysctl.d/10-default.conf
#echo "net.ipv4.neigh.default.gc_thresh1 = 512"  >> package/base-files/files/etc/sysctl.d/10-default.conf
#echo "net.ipv4.neigh.default.gc_thresh2 = 2048" >> package/base-files/files/etc/sysctl.d/10-default.conf
#echo "net.ipv4.neigh.default.gc_thresh3 = 4096" >> package/base-files/files/etc/sysctl.d/10-default.conf

#echo "" >> package/base-files/files/etc/netdata/netdata.conf
#echo "[plugin:proc]" >> package/base-files/files/etc/netdata/netdata.conf
#echo -e "\tipc = no" >> package/base-files/files/etc/netdata/netdata.conf

# 添加新主题
#rm -rf ./feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config

#sudo mkdir /lib/firmware/i915
#sudo curl -L https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/i915/kbl_dmc_ver1_04.bin -o /lib/firmware/i915/kbl_dmc_ver1_04.bin

#for X in $(ls -1 target/linux/x86 | grep "config-"); 
#do
#echo "CONFIG_FIRMWARE_IN_KERNEL=y" >> target/linux/x86/${X};
#echo 'CONFIG_EXTRA_FIRMWARE="i915/kbl_dmc_ver1_04.bin"' >> target/linux/x86/${X};
#echo 'CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"' >> target/linux/x86/${X};
#done

#关闭串口跑码
sed -i 's/console=tty0//g'  target/linux/x86/image/Makefile

