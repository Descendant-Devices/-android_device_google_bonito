#
# Copyright 2016 The Android Open Source Project
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

# Include descendant common configurations
include vendor/descendant/config/common_full_phone.mk

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline.mk)

$(call inherit-product, device/google/bonito/device-sargo.mk)
$(call inherit-product-if-exists, vendor/google_devices/bonito/proprietary/device-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Ring_Synth_04.ogg \
    ro.com.android.dataroaming=true \

PRODUCT_PACKAGES += \
    PhotoTable \
    WallpaperPicker \
    WAPPushManager \

# STOPSHIP deal with Qualcomm stuff later
# PRODUCT_RESTRICT_VENDOR_FILES := all

PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := Android
PRODUCT_NAME := aosp_sargo
PRODUCT_DEVICE := sargo
PRODUCT_MODEL := AOSP on sargo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="sargo" \
    TARGET_DEVICE="sargo" \
    PRIVATE_BUILD_DESC="sargo-user 10 QP1A.190711.020.C3 5869620 release-keys"

BUILD_FINGERPRINT := google/sargo/sargo:10/QP1A.190711.020.C3/5869620:user/release-keys
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/sargo/sargo:10/QP1A.190711.020.C3/5869620:user/release-keys

PRODUCT_COPY_FILES += \
    device/sample/etc/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml \
    $(LOCAL_PATH)/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
$(call inherit-product-if-exists, vendor/google/sargo/sargo-vendor.mk)
