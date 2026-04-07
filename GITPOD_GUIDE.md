# Gitpod 编译指南

## 🚀 快速开始

### 1. 推送代码到GitHub

```bash
cd d:\workspace\lineage-build
git init
git add .
git commit -m "Add Gitpod support"
git branch -M main
git remote add origin https://github.com/你的用户名/lineage-ienglish-9011.git
git push -u origin main
```

### 2. 启动Gitpod

在浏览器中访问：
```
https://gitpod.io/#https://github.com/你的用户名/lineage-ienglish-9011
```

或者：
1. 登录 https://gitpod.io
2. 连接你的GitHub账号
3. 选择仓库并启动工作区

### 3. 等待编译

- Gitpod会自动安装依赖和同步源码
- 这个过程可能需要1-2小时
- 你可以关闭浏览器，Gitpod会在后台运行

### 4. 下载编译结果

编译完成后：
1. 在Gitpod终端中找到输出文件路径
2. 右键文件 → Download

---

## ⚠️ 注意事项

| 项目 | 说明 |
|------|------|
| 免费额度 | 50小时/月 |
| 单次时长 | 无限制（但建议分段） |
| 存储 | 30GB临时存储 |
| 超时 | 无操作30分钟后暂停 |

---

## 🔧 手动操作

如果自动编译失败，可以在Gitpod终端手动执行：

```bash
# 进入源码目录
cd /workspace/lineage

# 设置设备配置
source build/envsetup.sh
breakfast ienglish_9011

# 编译
make -j4 systemimage
```

---

## 📦 编译结果位置

```
/workspace/lineage/out/target/product/ienglish_9011/
├── system.img    # 系统镜像
├── boot.img      # 内核镜像（如果编译了）
└── ...
```

---

## 💡 提示

1. **分段编译**：如果时间不够，可以先同步源码，下次再编译
2. **保存进度**：Gitpod会自动保存工作区状态
3. **下载结果**：编译完成后立即下载，工作区可能被清理
