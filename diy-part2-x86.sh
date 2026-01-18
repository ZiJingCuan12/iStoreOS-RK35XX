#!/bin/bash
#===============================================
# Description: DIY script Part 2 (System Settings for x86)
#===============================================

date_version=$(date +"%Y%m%d%H")

# --- 1. 定义您的品牌名称 ---
author="MuFVps"

# --- 2. 修改固件描述与Release信息 (登录页和详情页显示) ---
# 将 xiaomeng9597 替换为 MuFVps
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release

# --- 3. 修改主机名 (终端提示符 root@MuFVps) ---
sed -i "s/iStoreOS/${author}/g" package/base-files/files/bin/config_generate

# --- 4. 修改 SSH 登录 Banner (字符画 Logo) ---
cat > package/base-files/files/etc/banner << EOF
  __  __       _____ __      __
 |  \/  |     |  ___|\ \    / /
 | \  / |_   _| |_    \ \  / /_ __  ___
 | |\/| | | | |  _|    \ \/ /| '_ \/ __|
 | |  | | |_| | |       \  / | |_) \__ \\
 |_|  |_|\__,_|_|        \/  | .__/|___/
                             | |
                             |_|
 -----------------------------------------------------
 ${author} iStoreOS x86 Build (${date_version})
 -----------------------------------------------------
EOF

# --- 5. (可选) x86 固件默认设置调整 ---
# 默认 IP 是 192.168.100.1，如果您想修改为 192.168.1.1，请取消下面这行的注释 (#)
# sed -i 's/192.168.100.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# --- 6. 确保 x86 必要的依赖设置 (参考原仓库逻辑) ---
# 拉取 iStoreOS 风格设置 (这对保持界面风格很重要)
git clone --depth=1 -b main https://github.com/xiaomeng9597/istoreos-settings package/default-settings
