# Gitpod 上传文件指南

# iEnglish 9011 LineageOS 编译

## 问题
专有文件和内核文件太大，无法上传到 GitHub，需要在编译时从外部下载。

## 解决方案：使用 GitHub Release

### 步骤 1: 打包专有文件

在 Windows PowerShell 中运行:
```powershell
cd d:\workspace\lineage-build
.\package_proprietary_files.ps1
```

这会创建:
- `d:\workspace\lineage-build\vendor\ienglish\ienglish_9011\proprietary.zip` (约150MB)
- `d:\workspace\lineage-build\device\ienglish\ienglish_9011\prebuilt\kernel.zip` (约8MB)

### 步骤 2: 创建 GitHub Release
1. 打开 https://github.com/Potato-is-rotten/lineage-ienglish-9011/releases
2. 点击 "Draft a new release"
3. 上传 `proprietary.zip` 和 `kernel.zip`
4. 发布 Release
### 步骤 3: 获取下载链接
在 Release 页面:
- 右键点击文件名
- 复制下载链接 (例如 `https://github.com/Potato-is-rotten/lineage-ienglish-9011/releases/download/v1.0/proprietary.zip`)
### 步骤 4: 配置 Gitpod
在 Gitpod 工作区创建文件:
`.gitpod/proprietary-url`:
```
https://github.com/Potato-is-rotten/lineage-ienglish-9011/releases/download/v1.0/proprietary.zip
```
`.gitpod/kernel-url`:
```
https://github.com/Potato-is-rotten/lineage-ienglish-9011/releases/download/v1.0/kernel.zip
```
### 步骤 5: 推送到 GitHub
```powershell
cd "d:\workspace\Git Space\lineage-ienglish-9011"
git add .gitpod/proprietary-url .gitpod/kernel-url
git commit -m "Add proprietary files download URLs"
git push
```
### 自动下载流程
Gitpod 启动时会自动:
1. 读取 `.gitpod/proprietary-url` 文件
2. 下载专有文件
3. 解压到正确位置
4. 同样处理内核文件
## 文件大小限制
- GitHub Release 单文件限制: 2GB
- `proprietary.zip` 约 150MB ✓
- `kernel.zip` 约 8 MB ✓
## 替代方案: 使用私有仓库
如果文件太大
可以使用私有 Git 仓库
 或其他文件存储服务
- Google Drive
- Dropbox
- 自建服务器
