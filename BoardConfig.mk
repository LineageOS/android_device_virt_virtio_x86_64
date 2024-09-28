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
DEVICE_PATH := device/virt/virtio_x86_64

# Arch
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64

# GRUB
TARGET_GRUB_ARCH := x86_64-efi

# Kernel
BOARD_KERNEL_CMDLINE += \
    8250.nr_uarts=1 \
    console=ttyS0

BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_ARCH := x86

TARGET_KERNEL_CONFIG := \
    x86_64_defconfig \
    android-v-6.6/android-base.config \
    android-v-6.6/android-base-conditional_x86_64.config \
    lineageos/virtio.config \
    lineageos/peripheral/bluetooth.config \
    lineageos/peripheral/wifi.config \
    lineageos/feature/fbcon.config \
    lineageos/feature/pristine_kernel.config
