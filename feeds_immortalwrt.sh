#!/bin/bash
sed -i 's#https://github.com/immortalwrt/packages.git;openwrt-25.12#https://github.com/jkingben/build_openwrt.git;packages_immortalwrt_25#' feeds.conf.default
echo "src-git easytier https://github.com/EasyTier/luci-app-easytier.git;main" >> feeds.conf.default
echo "src-git mosdns https://github.com/sbwml/luci-app-mosdns;v5" >> feeds.conf.default
echo "src-git momo https://github.com/nikkinikki-org/OpenWrt-momo.git;main" >> feeds.conf.default
