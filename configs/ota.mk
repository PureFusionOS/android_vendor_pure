# Copyright (C) 2017 PureFusionOS ROM
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

PRODUCT_PACKAGES += \
        PureFusionOTA \
        libbypass

ifeq ($(WITH_OFFICIALOTA),true)
PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=PureFusionOS \
        ro.ota.version=$(shell date +"%Y%m%d_%H%M%S") \
        ro.ota.manifest=https://raw.githubusercontent.com/PureFusionOS/PureFusionOTA_SERVER/pf-o/$(shell echo "$(TARGET_PRODUCT)".xml)
endif

ifeq ($(BETA_OTA),true)
PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.BETAmanifest=https://raw.githubusercontent.com/PureFusionOS/PureFusionOTA_SERVER/pf-o/$(shell echo "$(TARGET_PRODUCT)"_beta.xml)
endif
