sed -i "s/luci-app-adbyby-plus //g" `grep luci-app-adbyby-plus -rl --include="Makefile" ./target/linux/`
sed -i "s/luci-app-zerotier //g" `grep luci-app-zerotier -rl --include="Makefile" ./target/linux/`
#sed -i "s/autosamba //g" `grep autosamba -rl --include="Makefile" ./target/linux/`
#sed -i "s/luci-app-wireguard //g" `grep luci-app-wireguard -rl --include="Makefile" ./target/linux/`
#sed -i "s/luci-app-xlnetacc //g" `grep luci-app-xlnetacc -rl --include="Makefile" ./target/linux/`
#sed -i "s/luci-app-nlbwmon //g" `grep luci-app-nlbwmon -rl ./include`
#sed -i "s/luci-app-ssr-plus //g" `grep luci-app-ssr-plus -rl ./include`
