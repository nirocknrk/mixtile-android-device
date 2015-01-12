# Copyright (C) 2011 The Android Open Source Project
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

# This file lists the modules that are specific to Sun6i but are used by
# all Sun6i devices.

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

SUN6I_DIR := device/mixtile/loftq/sun6i
DEVICE_PACKAGE_OVERLAYS := \
    $(SUN6I_DIR)/overlay

#include $(SUN6I_DIR)/tools/tools.mk

# allwinner audio and video coding libs
PRODUCT_PACKAGES += \
	libcedarxbase \
	libcedarxosal \
	libcedarv \
	libcedarv_base \
	libcedarv_adapter \
	libve \
	libaw_audio \
	libaw_audioa \
	libswdrm \
	libstagefright_soft_cedar_h264dec \
	libfacedetection \
	libthirdpartstream \
	libcedarxsftstream \
	libsunxi_alloc \
	libsrec_jni \
	libjpgenc \
	libstagefrighthw \
	libOmxCore \
	libOmxVdec \
	libOmxVenc \
	libaw_h264enc \
	libI420colorconvert \
	libcnr

# 3G Data Card Packages
PRODUCT_PACKAGES += \
        chat \
        rild \
        pppd

# 3G Data Card Configuration Flie
PRODUCT_COPY_FILES += \
        $(SUN6I_DIR)/rild/ip-down:system/etc/ppp/ip-down \
        $(SUN6I_DIR)/rild/ip-up:system/etc/ppp/ip-up \
        $(SUN6I_DIR)/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
        $(SUN6I_DIR)/rild/usb_modeswitch:system/bin/usb_modeswitch \
        $(SUN6I_DIR)/rild/call-pppd:system/xbin/call-pppd \
        $(SUN6I_DIR)/rild/usb_modeswitch.sh:system/xbin/usb_modeswitch.sh \
        $(SUN6I_DIR)/rild/apns-conf_sdk.xml:system/etc/apns-conf.xml \
        $(SUN6I_DIR)/rild/libsoftwinner-ril.so:system/lib/libsoftwinner-ril.so

# egl
PRODUCT_COPY_FILES += \
       $(SUN6I_DIR)/egl/pvrsrvctl:system/vendor/bin/pvrsrvctl \
       $(SUN6I_DIR)/egl/libusc.so:system/vendor/lib/libusc.so \
       $(SUN6I_DIR)/egl/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \
       $(SUN6I_DIR)/egl/libIMGegl.so:system/vendor/lib/libIMGegl.so \
       $(SUN6I_DIR)/egl/libpvr2d.so:system/vendor/lib/libpvr2d.so \
       $(SUN6I_DIR)/egl/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \
       $(SUN6I_DIR)/egl/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \
       $(SUN6I_DIR)/egl/libsrv_init.so:system/vendor/lib/libsrv_init.so \
       $(SUN6I_DIR)/egl/libsrv_um.so:system/vendor/lib/libsrv_um.so \
       $(SUN6I_DIR)/egl/libEGL_POWERVR_SGX544_115.so:system/vendor/lib/egl/libEGL_POWERVR_SGX544_115.so \
       $(SUN6I_DIR)/egl/libGLESv1_CM_POWERVR_SGX544_115.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX544_115.so \
       $(SUN6I_DIR)/egl/libGLESv2_POWERVR_SGX544_115.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX544_115.so \
       $(SUN6I_DIR)/egl/gralloc.sun6i.so:system/vendor/lib/hw/gralloc.sun6i.so \
       $(SUN6I_DIR)/egl/hwcomposer.sun6i.so:system/vendor/lib/hw/hwcomposer.sun6i.so \
       $(SUN6I_DIR)/egl/egl.cfg:system/lib/egl/egl.cfg \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

# for drm
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# audio
PRODUCT_COPY_FILES += \
	$(SUN6I_DIR)/hardware/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(SUN6I_DIR)/hardware/audio/phone_volume.conf:system/etc/phone_volume.conf

# 3G Data Card usb modeswitch File
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,$(SUN6I_DIR)/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)

# hardware module include file path
TARGET_HARDWARE_INCLUDE := $(TOP)/$(SUN6I_DIR)/include

BOARD_SEPOLICY_DIRS := \
        $(SUN6I_DIR)/sepolicy

BOARD_SEPOLICY_UNION := \
        genfs_contexts \
        file_contexts \
        file.te \
        vold.te \
        system.te \
        healthd.te \
        netd.te \
        app.te \
        untrusted_app.te

BUILD_NUMBER := $(shell date +%Y%m%d)
DISPLAY_BUILD_NUMBER := true
