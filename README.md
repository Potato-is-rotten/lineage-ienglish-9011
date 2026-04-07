# LineageOS 16 for iEnglish 9011 (MT6739/MT8765)

## 设备信息

| 项目 | 值 |
|------|-----|
| 设备代号 | ienglish_9011 |
| 处理器 | MT6739/MT8765 |
| 架构 | a64 (arm32-binder64) |
| 原厂系统 | Android 8.1 |
| 目标系统 | LineageOS 16 (Android 9) |

## GitHub Actions 编译说明

### ⚠️ 重要限制

| 限制 | 说明 |
|------|------|
| 免费额度 | 每月2000分钟 |
| 单次运行 | 最长6小时 |
| 存储空间 | 约14GB可用 |
| 内存 | 7GB |

### 可能的问题

1. **源码太大** - LineageOS完整源码约100GB+，GitHub Actions空间不足
2. **编译超时** - 完整编译可能超过6小时
3. **存储不足** - 可能需要分步编译

### 解决方案

#### 方案一：使用Docker预编译镜像（推荐）

```yaml
# 使用 lineageos4microg/docker-lineage-cicd
docker run \
  -v ~/lineage:/srv/src \
  -v ~/zips:/srv/zips \
  -v ~/ccache:/srv/ccache \
  -e DEVICE=ienglish_9011 \
  -e BRANCH_NAME=lineage-16.0 \
  lineageos4microg/docker-lineage-cicd
```

#### 方案二：自托管Runner

在自己的服务器上运行GitHub Actions Runner：
- 无时间限制
- 无存储限制
- 可以使用ccache加速

#### 方案三：使用其他CI服务

- **GitLab CI** - 更长的运行时间
- **Cirrus CI** - 支持更大存储
- **Travis CI** - 适合开源项目

## 使用方法

### 1. 创建GitHub仓库

```bash
# 初始化仓库
cd d:\workspace\lineage-build
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/你的用户名/lineage-ienglish-9011.git
git push -u origin main
```

### 2. 手动触发编译

1. 进入仓库页面
2. 点击 "Actions"
3. 选择 "Build LineageOS 16 for iEnglish 9011"
4. 点击 "Run workflow"

### 3. 下载编译结果

编译完成后，在 Actions 页面下载 artifact

## 设备配置文件

需要创建以下文件：

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
