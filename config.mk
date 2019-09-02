# Copyright (C) 2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Prebuilt Packages
PRODUCT_PACKAGES += \
    AmbientPlayProvider \
    SoundPickerPrebuilt \
    WallpaperPickerGooglePrebuilt \
    NexusLauncherPrebuilt \
    WellbeingPrebuilt \
    MarkupGoogle \
    WeatherClient

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_PACKAGES += \
    MatchmakerPrebuilt
endif

TARGET_MINIMAL_APPS ?= false

#ifeq ($(TARGET_MINIMAL_APPS), false)
#PRODUCT_PACKAGES += \
#    NexusWallpapersStubPrebuilt2018
#endif

# build.prop entrys
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true

# Fonts
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/pixelstyle/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    vendor/pixelstyle/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf

ADDITIONAL_FONTS_FILE := vendor/pixelstyle/fonts/google-sans.xml

# Pixel sysconfig
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml

# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.theme_id=5

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/lib/libsketchology_native.so:system/lib/libsketchology_native.so

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so
endif

# Include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/pixelstyle/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/pixelstyle/overlay/common/

# Weather
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/etc/permissions/org.pixelexperience.ambient.play.xml:system/etc/permissions/org.pixelexperience.ambient.play.xml \
    vendor/pixelstyle/etc/permissions/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
    vendor/pixelstyle/etc/default-permissions/org.pixelexperience.weather.client.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml \
    vendor/pixelstyle/etc/default-permissions/org.pixelexperience.ambient.play.provider.xml:system/etc/default-permissions/org.pixelexperience.ambient.play.provider.xml
