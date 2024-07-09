#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.2/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 安装Clang
sudo apt install -y clang

# 移除要替换的包
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/packages/net/chinadns-ng
rm -rf feeds/packages/net/shadowsocks-libev
rm -rf feeds/packages/net/simple-obfs


# 添加luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git passwall_packages
git clone https://github.com/xiaorouji/openwrt-passwall.git passwall
cp -rf passwall/luci-app-passwall feeds/luci/applications/luci-app-passwall
cp -rf passwall_packages/chinadns-ng feeds/packages/net/chinadns-ng
cp -rf passwall_packages/gn feeds/packages/net/gn
cp -rf passwall_packages/ssocks feeds/packages/net/ssocks
cp -rf passwall_packages/simple-obfs feeds/packages/net/simple-obfs
#rm -rf passwall_packages
#rm -rf passwall
