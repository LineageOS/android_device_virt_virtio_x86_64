#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Boot manager
TARGET_BOOT_MANAGER ?= grub

# Inherit from common
include device/virt/virtio-common/BoardConfigCommon.mk

USES_DEVICE_VIRT_VIRTIO_X86_64 := true

# Arch
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := sandybridge

# Boot manager
TARGET_GRUB_BOOT_CONFIGS += $(DEVICE_PATH)/bootmgr/grub/grub-boot.cfg

# Graphics (Mesa)
BOARD_MESA3D_GALLIUM_DRIVERS += crocus i915

# GRUB
TARGET_GRUB_ARCH := x86_64-efi

# Kernel
BOARD_KERNEL_CMDLINE += \
    8250.nr_uarts=1 \
    console=ttyS0

BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_ARCH := x86

TARGET_KERNEL_CONFIG += \
    lineageos/peripheral/passthrough_gpus.config

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/vendor
