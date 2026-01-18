#!/bin/bash
#===============================================
# Description: DIY script Part 1 (Add Feeds)
#===============================================

# 修改版本为编译日期
date_version=$(date +"%Y%m%d%H")
echo $date_version > version

# --- 2. 添加您需要的插件源 (Passwall & OpenClash) ---
echo "src-git passwall_pkg https://github.com/xiaorouji/openwrt-passwall.git;packages" >> feeds.conf.default
echo "src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;luci" >> feeds.conf.default
echo "src-git openclash https://github.com/vernesong/OpenClash.git" >> feeds.conf.default
