


BOARD_FLASH_BLOCK_SIZE := 512

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 864026112
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_VENDORIMAGE_PARTITION_SIZE := 209714688
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USERDATAIMAGE_PARTITION_SIZE := 5456789504
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741312
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_NO_BOOTLOADER := false
TARGET_BOOTLOADER_IS_2ND = true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi


TARGET_USES_64_BIT_BINDER := true
TARGET_BOARD_PLATFORM := poplar
TARGET_BOOTLOADER_BOARD_NAME := poplar 

BOARD_KERNEL_CMDLINE := androidboot.hardware=poplar androidboot.selinux=permissive firmware_class.path=/vendor/firmware mmz=ddr,0,0,60M


#sepolicy
BOARD_SEPOLICY_DIRS := device/hisilicon/poplar/sepolicy

# HAL's build config
# build config of feature graphics
TARGET_USES_HWC2 := true

TARGET_COPY_OUT_VENDOR := vendor

BOARD_BT_VENDOR := mediatek
BOARD_WIFI_VENDOR := mediatek
ifeq ($(BOARD_BT_VENDOR), broadcom)
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
endif
# wpa_supplicant and hostapd build configuration
# wpa_supplicant is used for WiFi STA, hostapd is used for WiFi SoftAP
ifeq ($(BOARD_WIFI_VENDOR), broadcom)
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
endif
