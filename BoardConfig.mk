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

# Kernel (Legacy)
KERNEL_VERSION := $(shell grep -s "^VERSION = " $(TARGET_KERNEL_SOURCE)/Makefile | awk '{ print $$3 }')
KERNEL_PATCHLEVEL := $(shell grep -s "^PATCHLEVEL = " $(TARGET_KERNEL_SOURCE)/Makefile | awk '{ print $$3 }')

ifeq ($(KERNEL_VERSION),4)
    ifeq ($(KERNEL_PATCHLEVEL),14)
        TARGET_KERNEL_CONFIG := x86_64_cuttlefish_defconfig
    else ifeq ($(KERNEL_PATCHLEVEL),19)
        TARGET_KERNEL_CONFIG := gki_defconfig
    else
        TARGET_KERNEL_CONFIG := x86_64_ranchu_defconfig
    endif
else ifeq ($(KERNEL_VERSION),5)
    TARGET_KERNEL_CONFIG := gki_defconfig
endif

TARGET_KERNEL_CONFIG += \
    lineageos/virtio.config \
    lineageos/feature/fbcon.config
