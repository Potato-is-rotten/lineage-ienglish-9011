# LineageOS 16 for iEnglish 9011 (MT6739/MT8765)

Lineage for iEnglish4 9011

## 设备信息

| 项目 | 值 |
|------|-----|
| 设备代号 | ienglish_9011 |
| 处理器 | MT6739/MT8765 |
| 架构 | a64 (arm32-binder64) |
| 原厂系统 | Android 8.1 |
| 目标系统 | LineageOS 16 (Android 9) |

## 编译方法

### 方法一：Gitpod（推荐，免费）

访问：https://gitpod.io/#https://github.com/Potato-is-rotten/lineage-ienglish-9011

### 方法二：GitHub Actions

1. 进入仓库页面
2. 点击 "Actions"
3. 选择 "Build LineageOS 16 for iEnglish 9011"
4. 点击 "Run workflow"

### 方法三：本地编译

```bash
# 使用Docker
docker run \
  -v ~/lineage:/srv/src \
  -v ~/zips:/srv/zips \
  -e DEVICE=ienglish_9011 \
  -e BRANCH_NAME=lineage-16.0 \
  lineageos4microg/docker-lineage-cicd
```

## 设备配置文件

```
device/ienglish/ienglish_9011/
├── AndroidProducts.mk
├── ienglish_9011.mk
├── BoardConfig.mk
├── device.mk
└── proprietary-files.txt

vendor/ienglish/ienglish_9011/
├── ienglish_9011-vendor.mk
└── proprietary/
    └── (从原厂提取的文件)

kernel/ienglish/ienglish_9011/
└── (内核源码或预编译内核)
```

## 下一步

1. 提取设备专有文件（从原厂ROM）
2. 创建完整的设备配置
3. 测试编译

## 相关链接

- [Gitpod使用指南](GITPOD_GUIDE.md)
- [免费编译方案对比](FREE_BUILD_OPTIONS.md)
