#!/bin/bash

# 从原厂ROM提取专有文件
# 用法: ./extract-files.sh <原厂系统挂载路径>

VENDOR_ROOT=device/ienglish/ienglish_9011/vendor
SOURCE=$1

if [ -z "$SOURCE" ]; then
    echo "用法: $0 <原厂系统路径>"
    echo "示例: $0 /mnt/system"
    echo "      $0 ~/extracted_vendor"
    exit 1
fi

echo "从 $SOURCE 提取专有文件..."

# 创建目标目录
mkdir -p $VENDOR_ROOT/lib
mkdir -p $VENDOR_ROOT/lib64
mkdir -p $VENDOR_ROOT/etc
mkdir -p $VENDOR_ROOT/firmware

# 读取proprietary-files.txt并提取
while read -r file; do
    # 跳过注释和空行
    [[ "$file" =~ ^#.*$ ]] && continue
    [[ -z "$file" ]] && continue
    
    src_file="$SOURCE/$file"
    dst_file="$VENDOR_ROOT/$file"
    
    if [ -f "$src_file" ]; then
        echo "提取: $file"
        mkdir -p "$(dirname "$dst_file")"
        cp -p "$src_file" "$dst_file"
    else
        echo "警告: 文件不存在 - $file"
    fi
done < proprietary-files.txt

echo "提取完成!"
echo "文件保存在: $VENDOR_ROOT"
