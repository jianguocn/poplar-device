# 1. bootimage
# 1.1 kernel and dtb
LOCAL_KERNEL := device/hisilicon/poplar-kernel/Image
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel
LOCAL_DTB := device/hisilicon/poplar-kernel/hi3798cv200-poplar.dtb
# TODO: fix the dest dtb name, normal it is some varient of product.dtb
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):dtb
PRODUCT_COPY_FILES += $(LOCAL_DTB):2ndbootloader

# 1.2 rootfs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootfs/ueventd.poplar.rc:root/ueventd.poplar.rc \
    $(LOCAL_PATH)/rootfs/fstab.poplar:root/fstab.poplar

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootfs/init.poplar.rc:root/init.poplar.rc \
    $(LOCAL_PATH)/rootfs/init.poplar.usb.rc:root/init.poplar.usb.rc \


# feature declaration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \

# framework properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m \
    ro.sf.lcd_density=160 \
    ro.opengles.version=196609 \



# start HAL audio >>>>>>>>
## feature declaration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \


## build packages
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.poplar \
## runtime configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \



# start HAL bt >>>>>>>>
## feature declaration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \


## build packages
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth@1.0-service.rc \
    android.hardware.bluetooth@1.0-impl \
## copy packages
PRODUCT_COPY_FILES += \
    vendor/hisilicon/poplar/proprietary/audio.a2dp.default.so:$(TARGET_COPY_OUT_VENDOR)/lib/audio.a2dp.default.so \
    vendor/hisilicon/poplar/proprietary/bluetooth.default.so:$(TARGET_COPY_OUT_VENDOR)/lib/bluetooth.default.so \
    vendor/hisilicon/poplar/proprietary/libbluetooth_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib/libbluetooth_mtk.so \
    vendor/hisilicon/poplar/proprietary/libbt-vendor.so:$(TARGET_COPY_OUT_VENDOR)/lib/libbt-vendor.so \
## firmwares
PRODUCT_COPY_FILES += \
## drivers
PRODUCT_COPY_FILES += \
    device/hisilicon/poplar-kernel/modules/btmtk_usb.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/btmtk_usb.ko \
## service init.rc scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bt_mtk.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/bt_mtk.rc \



# start HAL drm >>>>>>>>


## build packages
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
# raw instructions - do I have a better place to go?
ifeq ($(TARGET_TEE_IS_OPTEE), true)
   $(call inherit-product-if-exists, device/hisilicon/poplar/optee-packages.mk)
endif
## service init.rc scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/optee.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/optee.rc \



# start HAL graphics >>>>>>>>


## build packages
PRODUCT_PACKAGES += \
    libion \
    android.hardware.graphics.mapper@2.0 \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.allocator@2.0 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1 \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
## copy packages
PRODUCT_COPY_FILES += \
    vendor/hisilicon/poplar/proprietary/libGLES_mali.so:$(TARGET_COPY_OUT_VENDOR)/lib/egl/libGLES_mali.so \
    vendor/hisilicon/poplar/proprietary/hwcomposer.poplar.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/hwcomposer.poplar.so \
    vendor/hisilicon/poplar/proprietary/libhi_gfx2d.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhi_gfx2d.so \
    vendor/hisilicon/poplar/proprietary/liboverlay.so:$(TARGET_COPY_OUT_VENDOR)/lib/liboverlay.so \
    vendor/hisilicon/poplar/proprietary/gralloc.poplar.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/gralloc.poplar.so \
    vendor/hisilicon/poplar/proprietary/libion_ext.so:$(TARGET_COPY_OUT_VENDOR)/lib/libion_ext.so \



# start HAL keymaster >>>>>>>>


## build packages
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \



# start HAL media.codec >>>>>>>>


## copy packages
PRODUCT_COPY_FILES += \
    vendor/hisilicon/poplar/proprietary/libstagefrighthw.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefrighthw.so \
    vendor/hisilicon/poplar/proprietary/libhi_common.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhi_common.so \
    vendor/hisilicon/poplar/proprietary/libhi_msp.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhi_msp.so \
    vendor/hisilicon/poplar/proprietary/libhi_vfmw.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhi_vfmw.so \
    vendor/hisilicon/poplar/proprietary/libOMX_Core.so:$(TARGET_COPY_OUT_VENDOR)/lib/libOMX_Core.so \
    vendor/hisilicon/poplar/proprietary/libOMX.hisi.video.decoder.so:$(TARGET_COPY_OUT_VENDOR)/lib/libOMX.hisi.video.decoder.so \
    vendor/hisilicon/poplar/proprietary/libhiavplayer.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhiavplayer.so \
    vendor/hisilicon/poplar/proprietary/libhiavplayer_adp.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhiavplayer_adp.so \
    vendor/hisilicon/poplar/proprietary/libhiavplayerservice.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhiavplayerservice.so \
    vendor/hisilicon/poplar/proprietary/hiavplayer:$(TARGET_COPY_OUT_VENDOR)/bin/hiavplayer \
## service init.rc scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hiavplayer.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hiavplayer.rc \
## runtime configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \



# start HAL wifi >>>>>>>>
## feature declaration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \


## build packages
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi.supplicant@1.0 \
    wificond \
    wificond.rc \
    libwpa_client \
    wpa_cli \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl \
## copy packages
PRODUCT_COPY_FILES += \
    vendor/hisilicon/poplar/proprietary/libwifi-hal.so:$(TARGET_COPY_OUT_VENDOR)/lib/libwifi-hal.so \
    vendor/hisilicon/poplar/proprietary/wpa_supplicant:$(TARGET_COPY_OUT_VENDOR)/bin/hw/wpa_supplicant \
    vendor/hisilicon/poplar/proprietary/hostapd:$(TARGET_COPY_OUT_VENDOR)/bin/hostapd \
## firmwares
PRODUCT_COPY_FILES += \
    vendor/hisilicon/poplar/proprietary/firmware/EEPROM_MT7668.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/EEPROM_MT7668.bin \
    vendor/hisilicon/poplar/proprietary/firmware/EEPROM_MT7668_e1.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/EEPROM_MT7668_e1.bin \
    vendor/hisilicon/poplar/proprietary/firmware/mt7668_patch_e1_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt7668_patch_e1_hdr.bin \
    vendor/hisilicon/poplar/proprietary/firmware/mt7668_patch_e2_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt7668_patch_e2_hdr.bin \
    vendor/hisilicon/poplar/proprietary/firmware/WIFI_RAM_CODE2_USB_MT7668.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/WIFI_RAM_CODE2_USB_MT7668.bin \
    vendor/hisilicon/poplar/proprietary/firmware/WIFI_RAM_CODE_MT7668.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/WIFI_RAM_CODE_MT7668.bin \
    vendor/hisilicon/poplar/proprietary/firmware/TxPwrLimit_MT76x8.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/TxPwrLimit_MT76x8.dat \
    vendor/hisilicon/poplar/proprietary/firmware/wifi.cfg:$(TARGET_COPY_OUT_VENDOR)/firmware/wifi.cfg \
## drivers
PRODUCT_COPY_FILES += \
    device/hisilicon/poplar-kernel/modules/wlan_mt7668_usb.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wlan_mt7668_usb.ko \
## service init.rc scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/wifi.rc \
## runtime configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
## feature wifi properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \



# manifest.xml
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:${TARGET_COPY_OUT_VENDOR}/manifest.xml

