#!/bin/bash
#===============================================
# Description: DIY script Part 2 (System Settings for x86)
#===============================================

date_version=$(date +"%Y%m%d%H")
author="MuFVps"

# 1. 修改系统描述
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release

# 2. 修改主机名
sed -i "s/iStoreOS/${author}/g" package/base-files/files/bin/config_generate

# 3. 自定义 Banner
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

# 4. 修复：先删除旧目录，再 Clone 新设置 (防止脚本报错)
rm -rf package/default-settings
git clone --depth=1 -b main https://github.com/xiaomeng9597/istoreos-settings package/default-settings
