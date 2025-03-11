#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

USES_DEVICE_VIRT_VIRTIO_X86_64 := true

# Boot manager
TARGET_BOOT_MANAGER ?= grub

# GRUB
TARGET_GRUB_ARCH := x86_64-efi
TARGET_GRUB_2ND_ARCH := i386-pc

# Inherit from common
include device/virt/virtio-common/BoardConfigCommon.mk

# Arch
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := sandybridge

# Kernel
BOARD_KERNEL_CMDLINE += \
    8250.nr_uarts=1 \
    console=ttyS0

BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_ARCH := x86

# Virtual Machine template
TARGET_VM_UTM_TEMPLATE_DIR := $(DEVICE_PATH)/vm_templates/utm
