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

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pure/overlay/common

# Use signing keys for only official builds
#ifeq ($(PURE_BUILD_TYPE),OFFICIAL)
#    PRODUCT_DEFAULT_DEV_CERTIFICATE := ../.keys/releasekey
#endif

# Main Required Packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Messaging \
    Calculator \
    DeskClock \
    Turbo \
    LatinIME \
    Gallery2 \
    WallpaperPicker

# Extra packages
PRODUCT_PACKAGES += \
    OmniJaws \
    MatLog


# Custom Packages
PRODUCT_PACKAGES += \
    Busybox

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# MusicFX advanced effects
#TARGET_NO_DSPMANAGER := true
ifneq ($(TARGET_NO_DSPMANAGER), true)
PRODUCT_PACKAGES += \
    libcyanogen-dsp \
    audio_effects.conf
endif
