#
# Copyright 2015 The CyanogenMod Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := full_YT2
PRODUCT_DEVICE := YT2
PRODUCT_BRAND := Lenovo
PRODUCT_MANUFACTURER := LENOVO
PRODUCT_MODEL := YOGA Tablet 2-830F

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=YT2_8_row_wifi \
    BUILD_FINGERPRINT=Lenovo/YT2_8_row_wifi/YT2:5.0.1/LRX22C/YT2-830F_USR_S100250_1601190639_:user/release-keys \
    PRIVATE_BUILD_DESC="YT2_8_row_wifi-user 5.0.1 LRX22C YT2-830F_USR_S100250_1601190639_WW52_ROW release-keys"

# Inherit from YT2 device
$(call inherit-product, device/lenovo/YT2/device.mk)

PRODUCT_RUNTIMES := runtime_libart_default

$(call inherit-product-if-exists, vendor/lenovo/YT2/YT2-vendor.mk)
