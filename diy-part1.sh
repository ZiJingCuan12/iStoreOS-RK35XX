#!/bin/bash
#===============================================
# Description: DIY script Part 1 (Add Feeds)
#===============================================

# --- 1. 关键步骤：清理潜在冲突 ---
# 很多编译错误是因为原来的 feeds.conf.default 里已经有了一个 xmpackages 或其他源
# 这里我们用 sed 命令把它们删掉/注释掉，防止重复
sed -i '/xmpackages/d' feeds.conf.default
sed -i '/passwall/d' feeds.conf.default
sed -i '/openclash/d' feeds.conf.default
sed -i '/helloworld/d' feeds.conf.default

# --- 2. 添加我们需要的官方源 (Clean Add) ---
# 添加 Passwall (官方源 - packages分支更稳定)
echo "src-git passwall_pkg https://github.com/xiaorouji/openwrt-passwall.git;packages" >> feeds.conf.default
echo "src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;luci" >> feeds.conf.default

# 添加 OpenClash (官方源)
echo "src-git openclash https://github.com/vernesong/OpenClash.git" >> feeds.conf.default

# --- 3. (可选) 修复部分依赖问题 ---
# 有时候 ruby 等依赖会导致编译失败，这里不做操作，通常 iStoreOS 底层已解决
