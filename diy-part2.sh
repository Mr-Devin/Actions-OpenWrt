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
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile feeds/luci/collections/luci-nginx/Makefile feeds/luci/collections/luci-light/Makefile
sed -i 's/Bootstrap/argon/g' feeds/luci/collections/luci/Makefile feeds/luci/collections/luci-nginx/Makefile feeds/luci/collections/luci-light/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate


sed -i "s/\.disabled='1'/\.disabled='0'/g" package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc
sed -i "s/\.ssid='OpenWrt'/\.ssid='2077'/g" package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc

# 默认密码
sed -i "s/^root:::0:99999:7:::/root:\$1\$zQaIXyAb\$gyLqELl5w39SAgDAlg8A10:18376:0:99999:7:::/" package/base-files/files/etc/shadow

