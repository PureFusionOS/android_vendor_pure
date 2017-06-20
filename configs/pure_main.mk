# Copyright (C) 2017 The Pure Nexus Project
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

ifndef IS_ARM64
IS_ARM64 := false
endif

ifeq ($(IS_ARM64),true)
TARGET_ARCH := arm64
else
TARGET_ARCH := arm
endif

# Inherit prebuilt apps
$(call inherit-product-if-exists, vendor/gapps/prebuilt.mk)

# Main Required Packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Phonograph \
    messaging \
    LiveWallpapers \
    LiveWallpapersPicker

# Include explicitly to work around Facelock issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# Custom Packages
PRODUCT_PACKAGES += \
    Busybox \
    ThemeInterfacer \
    OmniStyle \
    Turbo \
    PixelLauncher \
    WallpaperPickerGoogle \
    ViaBrowser \
    Gallery2

# More Derps
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    powertop \
    libbthost_if
    
# Stagefright FFMPEG plugin
ifeq ($(WITH_FFMPEG),true)
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml
endif

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# MusicFX advanced effects
ifneq ($(TARGET_NO_DSPMANAGER), true)
PRODUCT_PACKAGES += \
    libcyanogen-dsp \
    audio_effects.conf
endif

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter arm64,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/pure/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so \
    vendor/pure/prebuilt/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/pure/prebuilt/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
    vendor/pure/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif
