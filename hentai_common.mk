#
# Copyright 2020 The Android Open-Source Project
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

#
# All components inherited here go to system image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

# Enable CSI checking
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

#
# All components inherited here go to product image
#
$(call inherit-product, vendor/hentai/build/product/hentai_product.mk)

#
# All components inherited here go to vendor image
#
# TODO(b/136525499): move *_vendor.mk into the vendor makefile later
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

#$(call inherit-product, device/google/zumapro/device.mk)
#$(call inherit-product-if-exists, vendor/google_devices/zumapro/proprietary/device-vendor.mk)

# TODO: fix
# PRODUCT_RESTRICT_VENDOR_FILES := all

# b/189477034: Bypass build time check on uses_libs until vendor fixes all their apps
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

# Enforce dark boot animation
PRODUCT_PRODUCT_PROPERTIES += \
    ro.boot.theme=1

# PixelApps
$(call inherit-product, vendor/pixelapps/config.mk)

# PixelApps overlays
ifeq ($(TARGET_PREBUILT_PIXELAPPS), true)
    PRODUCT_PACKAGES += \
        SystemUIGoogleOverlayZumapro \
        SettingsGoogleOverlayZumapro
endif

# Product sysconfigs
PRODUCT_PACKAGES += \
    adaptivecharging \
    allowlist_com.android.omadm.service \
    dreamliner \
    GoogleCamera_6gb_or_more_ram \
    quick_tap \
    pixel_experience_2021_midyear \
    pixel_experience_2021 \
    pixel_experience_2022_midyear \
    pixel_experience_2022 \
    pixel_experience_2023_midyear \
    pixel_experience_2023 \
    pixel_experience_2024_midyear \
    pixel_experience_2024 \
    preinstalled-packages-product-pixel-2023-and-newer \
    satellite_sos \
    vendor-apex-allowlist
