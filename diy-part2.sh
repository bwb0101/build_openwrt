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

echo "" >> package/base-files/files/etc/sysctl.d/10-default.conf
echo "net.ipv4.neigh.default.gc_thresh1 = 512"  >> package/base-files/files/etc/sysctl.d/10-default.conf
echo "net.ipv4.neigh.default.gc_thresh2 = 2048" >> package/base-files/files/etc/sysctl.d/10-default.conf
echo "net.ipv4.neigh.default.gc_thresh3 = 4096" >> package/base-files/files/etc/sysctl.d/10-default.conf

#echo "" >> package/base-files/files/etc/netdata/netdata.conf
#echo "[plugin:proc]" >> package/base-files/files/etc/netdata/netdata.conf
#echo -e "\tipc = no" >> package/base-files/files/etc/netdata/netdata.conf

# 添加新主题
rm -rf ./feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config

sudo mkdir /lib/firmware/i915
sudo curl -L https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/i915/kbl_dmc_ver1_04.bin -o /lib/firmware/i915/kbl_dmc_ver1_04.bin

for X in $(ls -1 target/linux/x86 | grep "config-"); 
do
echo "CONFIG_FIRMWARE_IN_KERNEL=y" >> target/linux/x86/${X};
echo 'CONFIG_EXTRA_FIRMWARE="i915/kbl_dmc_ver1_04.bin"' >> target/linux/x86/${X};
echo 'CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"' >> target/linux/x86/${X};
done

#关闭串口跑码
sed -i 's/console=tty0//g'  target/linux/x86/image/Makefile

