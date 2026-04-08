$(call inherit-product, device/ienglish/ienglish_9011/device.mk)

$(call inherit-product, vendor/lineage/config/common_full_tablet.mk)

PRODUCT_NAME := lineage_ienglish_9011
PRODUCT_DEVICE := ienglish_9011
PRODUCT_BRAND := iEnglish
PRODUCT_MODEL := iEnglish 9011
PRODUCT_MANUFACTURER := iEnglish

PRODUCT_GMS_CLIENTID_BASE := android-ienglish

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=iEnglish_9011 \
    PRIVATE_BUILD_DESC="iEnglish_9011-user 8.1.0 O11019 vAQ4-0 release-keys"

BUILD_FINGERPRINT := iEnglish/iEnglish_4/E8:8.1.0/O11019/vAQ4-0:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
