$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.device_admin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_admin.xml \
    frameworks/native/data/etc/android.software.webview.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.software.managed_users.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.managed_users.xml

PRODUCT_PACKAGES += \
    librs_jni \
    libion \
    libcutils \
    libgui_vendor \
    libtinyxml2 \
    libjsoncpp

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.drm@1.0-impl \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.ir@1.0-impl \
    android.hardware.keymaster@3.0-impl \
    android.hardware.light@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.sensors@1.0-impl \
    android.hardware.thermal@1.0-impl \
    android.hardware.wifi@1.0-impl \
    android.hardware.wifi@1.0-service

PRODUCT_PACKAGES += \
    libaudiopolicymanager \
    libeffects \
    libstagefright \
    libstagefright_omx \
    libstagefright_foundation \
    libmediaextractor \
    libmediadrm \
    libdrmframework

PRODUCT_PACKAGES += \
    wpa_supplicant \
    wpa_cli \
    hostapd \
    hostapd_cli

PRODUCT_PACKAGES += \
    camera.mt6739 \
    audio.primary.mt6739 \
    audio.r_submix.default \
    audio.usb.default \
    gps.mt6739 \
    gralloc.mt6739 \
    hwcomposer.mt6739 \
    lights.mt6739 \
    memtrack.mt6739 \
    power.mt6739 \
    sensors.mt6739 \
    thermal.mt6739 \
    consumerir.mt6739

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware=mt6739 \
    ro.hardware.egl=mtk \
    ro.hardware.gralloc=mtk \
    ro.opengles.version=196610 \
    ro.sf.lcd_density=213 \
    persist.sys.dalvik.vm.lib.2=libart.so \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=384m \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=16m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.75

PRODUCT_VENDOR_PROPERTIES += \
    ro.mediatek.platform=MT6739 \
    ro.mediatek.chip_ver=S01 \
    ro.board.platform=mt6739 \
    ro.product.board=a3a84g \
    persist.radio.multisim.config=ss \
    ro.telephony.sim.count=1 \
    ro.mtk_lte_support=1 \
    ro.mtk_gps_support=1 \
    ro.mtk_wlan_support=1 \
    ro.mtk_bt_support=1 \
    ro.mtk_wfd_support=1 \
    ro.mtk_aal_support=1 \
    ro.mtk_pq_support=2 \
    ro.mtk_blulight_def_support=1 \
    ro.mtk_widevine_drm_l3_support=1 \
    ro.mtk_trustonic_tee_support=1 \
    ro.hardware.kmsetkey=trustonic

PRODUCT_VENDOR_PROPERTIES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    media.swhevccodectype=0 \
    media.wfd.video-bitrate=5000000

$(call inherit-product, vendor/ienglish/ienglish_9011/ienglish_9011-vendor.mk)
