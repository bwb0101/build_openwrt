#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/luci2/bin/config_generate

# replace ash to bash
sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd

# replace default banner
rm -rf package/base-files/files/etc/banner
cp $GITHUB_WORKSPACE/data/banner package/base-files/files/etc/banner
