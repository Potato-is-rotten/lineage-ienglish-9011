# iEnglish 9011 设备配置

# 继承基础配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# 继承LineageOS配置
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# 设备信息
PRODUCT_NAME := lineage_ienglish_9011
PRODUCT_DEVICE := ienglish_9011
PRODUCT_BRAND := iEnglish
PRODUCT_MODEL := iEnglish 9011
PRODUCT_MANUFACTURER := iEnglish

# 屏幕密度
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# 权限
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml

# Vendor
$(call inherit-product, vendor/ienglish/ienglish_9011/ienglish_9011-vendor.mk)
