#
# Copyright 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := silvermont
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_BOARD_PLATFORM := baytrail
TARGET_BOOTLOADER_BOARD_NAME := baytrail
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_DROIDBOOT_LIBS := libintel_droidboot

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/YT2/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := YT2,yt2

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Dex-preoptimization: Speeds up initial boot (if we ever o a user build, which we don't)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# EGL config
BOARD_EGL_CFG := device/lenovo/YT2/rootdir/system/etc/egl.cfg

# Houdini: enable ARM codegen for x86
BUILD_ARM_FOR_X86 := true

# Graphics
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
OVERRIDE_RS_DRIVER := libRSDriver_intel.so
USE_OPENGL_RENDERER := true

#ADDITIONAL_DEFAULT_PROPERTIES += \
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.opengles.version = 196608

MAX_EGL_CACHE_ENTRY_SIZE := 65536
MAX_EGL_CACHE_SIZE := 1048576

# Init
TARGET_IGNORE_RO_BOOT_SERIALNO := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/lenovo/baytrail
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_CONFIG := YT2_8_row_lte_defconfig

# Kernel cmdline
BOARD_KERNEL_CMDLINE := loglevel=4 console=logk0 earlyprintk=nologger androidboot.bootmedia=sdcard androidboot.hardware=byt_t_ffrd8 watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 oops=panic panic=40 vmalloc=172M debug_locks=0 bootboost=1 vga=current i915.modeset=1 drm.vblankoffdelay=1 acpi_backlight=vendor i915.mipi_panel_id=3 androidboot.selinux=permissive

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Logd
TARGET_USES_LOGD := false

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 2048
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12256784384

# PowerHAL
TARGET_POWERHAL_VARIANT := baytrail

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/lenovo/YT2/rootdir/fstab.byt_t_ffrd8

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
WIFI_DRIVER_MODULE_NAME     := "bcm43241"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcm43241/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin_43241_b4"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm43241.ko"

# inherit from the proprietary version
-include vendor/lenovo/YT2/BoardConfigVendor.mk
