# 免费编译方案（不占用本地存储）

## 方案对比

| 方案 | 存储占用 | 时间 | 难度 |
|------|----------|------|------|
| GitHub Actions (最小化) | 0 | 可能超时 | 中 |
| Gitpod (推荐) | 0 | 50小时/月 | 低 |
| Google Colab | 0 | 12小时/次 | 低 |
| 临时WSL + 外置硬盘 | 临时 | 无限制 | 中 |

---

## 🌟 推荐：Gitpod（免费50小时/月）

Gitpod提供免费的云端开发环境，适合编译Android：

### 步骤：

1. **创建Gitpod配置**

```yaml
# .gitpod.yml
image: lineageos4microg/docker-lineage-cicd

tasks:
  - name: Build LineageOS
    init: |
      repo init -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth=1
      repo sync -c -j4 --no-tags --no-clone-bundle
    command: |
      source build/envsetup.sh
      breakfast ienglish_9011
      brunch ienglish_9011

workspaceLocation: /workspace/lineage
```

2. **启动Gitpod**
   - 访问 https://gitpod.io/#你的仓库地址
   - 自动启动云端环境

3. **下载编译结果**
   - 编译完成后从工作区下载

---

## 🔬 备选：Google Colab（免费）

使用Google Colab的免费GPU/TPU资源：

```python
# 在Colab中运行

# 1. 安装依赖
!apt-get update
!apt-get install -y bc bison build-essential ccache curl flex \
  g++-multilib gcc-multilib git gnupg gperf lib32ncurses5-dev \
  lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev \
  libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils \
  lzop pngcrush rsync schedtool squashfs-tools xsltproc zip \
  zlib1g-dev openjdk-8-jdk

# 2. 挂载Google Drive（保存编译结果）
from google.colab import drive
drive.mount('/content/drive')

# 3. 同步源码（使用浅克隆减少空间）
!mkdir -p ~/los && cd ~/los
!repo init -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth=1
!repo sync -c -j4 --no-tags --no-clone-bundle

# 4. 编译
%cd ~/los
!source build/envsetup.sh && breakfast ienglish_9011 && brunch ienglish_9011

# 5. 复制到Google Drive
!cp ~/los/out/target/product/ienglish_9011/*.zip /content/drive/MyDrive/
```

---

## 💾 临时方案：外置硬盘 + WSL

如果愿意临时使用外置硬盘：

```powershell
# 1. 连接外置硬盘（如E盘）

# 2. 在WSL中挂载
wsl
sudo mkdir -p /mnt/e/lineage
sudo mount -t drvfs E: /mnt/e

# 3. 在外置硬盘上编译
cd /mnt/e/lineage
# ... 编译步骤 ...

# 4. 编译完成后删除源码
rm -rf /mnt/e/lineage
```

---

## 📊 推荐选择

| 你的情况 | 推荐方案 |
|----------|----------|
| 有Google账号 | **Google Colab** |
| 有GitHub账号 | **Gitpod** |
| 有外置硬盘 | **临时WSL** |
| 都不想用 | **GitHub Actions最小化** |

---

## ⚠️ 注意事项

- 所有云方案都有时间限制
- 编译可能需要多次尝试
- 建议先测试最小化编译（只编译system.img）
