#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Kernel (Prebuilt)
TARGET_PREBUILT_EMULATOR_KERNEL_USE ?= 6.6
TARGET_PREBUILT_KERNEL_ARCH := x86_64
TARGET_PREBUILT_KERNEL_MODULES_ARCH := x86-64

# Inherit from common
$(call inherit-product, device/virt/virtio-common/device-common.mk)

DEVICE_PATH := device/virt/virtio_x86_64

# Graphics (Gralloc)
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.minigbm_intel \
    android.hardware.graphics.mapper@4.0-impl.minigbm_intel \
    gralloc.minigbm_intel \
    mapper.minigbm_intel

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/virtio_x86_64-graphics.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/virtio_x86_64-graphics.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
