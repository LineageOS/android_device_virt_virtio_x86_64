#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common
$(call inherit-product, device/virt/virtio-common/device-common.mk)

DEVICE_PATH := device/virt/virtio_x86_64

# Graphics (Allocator)
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.minigbm_intel \
    gralloc.minigbm_intel \
    mapper.minigbm_intel

# Graphics (Composer)
PRODUCT_PACKAGES += \
    android.hardware.composer.hwc3-service.drm.virtio_x86_64

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/virtio_x86_64-graphics.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/virtio_x86_64-graphics.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
