#!/bin/bash
sed -i 's#https://github.com/coolsnowwolf/packages#https://github.com/jkingben/build_openwrt.git;packages_lean#' feeds.conf.default
sed -i 's#https://github.com/coolsnowwolf/luci.git;openwrt-23.05#https://github.com/jkingben/build_openwrt.git;luci_lean#' feeds.conf.default
echo ""  >> feeds.conf.default
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> feeds.conf.default
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default
echo "src-git ssrp https://github.com/fw876/helloworld.git;master" >> feeds.conf.default
echo "src-git openclash https://github.com/vernesong/OpenClash.git;master" >> feeds.conf.default
#echo "src-git bypass https://github.com/kiddin9/openwrt-bypass.git;main" >>  feeds.conf.default
#echo "src-git subconverter https://github.com/tindy2013/openwrt-subconverter.git;master" >>  feeds.conf.default
