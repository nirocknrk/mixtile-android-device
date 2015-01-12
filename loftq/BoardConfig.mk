# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# cpu stuff
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOARD_PLATFORM := sun6i
TARGET_BOOTLOADER_BOARD_NAME := exdroid
TARGET_GPU_USE_POWERVR := true
USE_OPENGL_RENDERER := true
USE_HW_COMPOSER := true

# bt default config
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/mixtile/loftq/bluetooth

PRELOAD_MAX_RETRY_ATTEMPTS := 3

# wireless config
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# no hardware camera
USE_CAMERA_STUB := true

# audio & camera & cedarx
CEDARX_CHIP_VERSION := F33
CEDARX_USE_SWAUDIO := Y

# recovery IR controll
SW_BOARD_IR_RECOVERY := true

#widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# use our own init.rc
TARGET_PROVIDES_INIT_RC :=true

# image related
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

INSTALLED_KERNEL_TARGET := kernel
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := console=ttyS0,115200 rw init=/init loglevel=4
BOARD_KERNEL_CMDLINE += selinux=0
BOARD_KERNEL_CMDLINE += vmalloc=512M

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

#recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_UI_LIB := librecovery_ui_loftq
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_loftq
#TARGET_RELEASETOOLS_EXTENSIONS := device/mixtile/loftq

#TARGET_KERNEL_UBUNTU := true
#TARGET_KERNEL_UBUNTU_META := linux-image-loftq
#TARGET_KERNEL_UBUNTU_SERIES := vivid

