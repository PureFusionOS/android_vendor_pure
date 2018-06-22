# Copyright (C) 2017 Pure Fusion OS
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


# Inherit AOSP device configuration for pme
$(call inherit-product, device/lge/h872/aosp_h872.mk)

# Set those variables here to overwrite the inherited values.

PRODUCT_DEVICE := h872
PRODUCT_NAME := h872
PRODUCT_BRAND := HTC
PRODUCT_MODEL := LG-H872
PRODUCT_MANUFACTURER := LGE
PRODUCT_RELEASE_NAME := h872

TARGET_VENDOR := lge

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
