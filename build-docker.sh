#!/bin/bash

# LineageOS 16 编译脚本 - 使用Docker
# 适用于本地编译或云服务器

# 配置
DEVICE="ienglish_9011"
BRANCH="lineage-16.0"
CCACHE_SIZE="50G"

# 目录
WORK_DIR="$HOME/lineage-build"
SOURCE_DIR="$WORK_DIR/src"
ZIP_DIR="$WORK_DIR/zips"
CCACHE_DIR="$WORK_DIR/ccache"

# 创建目录
mkdir -p "$SOURCE_DIR" "$ZIP_DIR" "$CCACHE_DIR"

# 拉取Docker镜像
echo "Pulling Docker image..."
docker pull lineageos4microg/docker-lineage-cicd

# 运行编译
echo "Starting build..."
docker run \
    --rm \
    -v "$SOURCE_DIR:/srv/src" \
    -v "$ZIP_DIR:/srv/zips" \
    -v "$CCACHE_DIR:/srv/ccache" \
    -v "$WORK_DIR/manifests:/srv/local_manifests" \
    -e DEVICE="$DEVICE" \
    -e BRANCH_NAME="$BRANCH" \
    -e CCACHE_SIZE="$CCACHE_SIZE" \
    -e WITH_SU=false \
    -e RELEASE_TYPE=UNOFFICIAL \
    lineageos4microg/docker-lineage-cicd

echo "Build completed!"
echo "ZIP files: $ZIP_DIR"
ls -la "$ZIP_DIR"
