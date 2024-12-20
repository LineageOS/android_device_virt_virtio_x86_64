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

# Google Apps
PRODUCT_PACKAGES += \
    GmsOverlay \
    GmsSettingsOverlay \
    GmsSettingsProviderOverlay \
    GmsSetupWizardOverlay

# Native bridge
include frameworks/libs/native_bridge_support/native_bridge_support.mk

PRODUCT_SOONG_NAMESPACES += \
    frameworks/libs/native_bridge_support/libc

PRODUCT_PACKAGES += \
    $(NATIVE_BRIDGE_PRODUCT_PACKAGES) \
    libberberis_exec_region

PRODUCT_SYSTEM_PROPERTIES += \
    ro.dalvik.vm.native.bridge=libndk_translation.so \
    ro.dalvik.vm.isa.arm64=x86_64 \
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1 \
    ro.ndk_translation.version=0.2.3

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Inherit from proprietary files
$(call inherit-product, vendor/virt/virtio_x86_64/virtio_x86_64-vendor.mk)
