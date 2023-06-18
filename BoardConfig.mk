#
# Copyright (C) 2020 The LineageOS Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from meizu sdm710-common
-include device/meizu/sdm710-common/BoardConfigCommon.mk

DEVICE_PATH := device/meizu/m1852

# Assertion
TARGET_OTA_ASSERT_DEVICE := m1852,M1852

# Kernel
BOARD_KERNEL_CMDLINE += g_android.luns=1 g_android.removable=1 g_android.cdrom=1
TARGET_KERNEL_CONFIG := m1852_defconfig

# HAX: Remove ASAP
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Releasetools
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# inherit from the proprietary version
-include vendor/meizu/m1852/BoardConfigVendor.mk
