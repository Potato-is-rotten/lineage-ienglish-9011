#!/bin/bash
# setup-makefiles.sh - Generate vendor-blobs.mk from proprietary-files.txt

DEVICE=ienglish_9011
VENDOR=ienglish
OUT=vendor/$VENDOR/$DEVICE/ienglish_9011-vendor-blobs.mk
PROP_FILE=device/$VENDOR/$DEVICE/proprietary-files.txt

echo "# Auto-generated vendor blobs makefile" > $OUT
echo "# iEnglish 9011 proprietary files" >> $OUT
echo "" >> $OUT
echo "PRODUCT_COPY_FILES += \\" >> $OUT

first=true
while IFS= read -r line; do
    if [[ "$line" =~ ^- ]]; then
        file="${line#-}"
        file=$(echo "$file" | xargs)
        if [ -n "$file" ]; then
            if [ "$first" = true ]; then
                echo "    vendor/$VENDOR/$DEVICE/proprietary/$file:\$(TARGET_COPY_OUT_VENDOR)/$file \\" >> $OUT
                first=false
            else
                echo "    vendor/$VENDOR/$DEVICE/proprietary/$file:\$(TARGET_COPY_OUT_VENDOR)/$file \\" >> $OUT
            fi
        fi
    fi
done < "$PROP_FILE"

echo "" >> $OUT
echo "Done! Generated $OUT"
