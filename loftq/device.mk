#
# Copyright (C) 2011 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/mixtile/loftq/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# init.rc
PRODUCT_COPY_FILES += \
	device/mixtile/loftq/init.rc:root/init.rc \


PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
        device/mixtile/loftq/init.loftq.rc:root/init.loftq.rc \
        device/mixtile/loftq/ueventd.loftq.rc:root/ueventd.loftq.rc \
        device/mixtile/loftq/modules/modules/nand.ko:root/nand.ko \
        device/mixtile/loftq/initlogo.rle:root/initlogo.rle \
        device/mixtile/loftq/fstab.loftq:root/fstab.loftq \
        device/mixtile/loftq/needfix.rle:root/needfix.rle \
        device/mixtile/loftq/media/bootanimation.zip:system/media/bootanimation.zip \
        device/mixtile/loftq/media/bootlogo.bmp:system/media/bootlogo.bmp \
        device/mixtile/loftq/media/initlogo.bmp:system/media/initlogo.bmp \
        device/mixtile/loftq/media/boot.wav:system/media/boot.wav \
        device/mixtile/loftq/init.recovery.loftq.rc:root/init.recovery.loftq.rc \
        device/mixtile/loftq/init.loftq.usb.rc:root/init.loftq.usb.rc \
        device/mixtile/loftq/modules/modules/sun6i-ir.ko:root/sun6i-ir.ko \
        device/mixtile/loftq/modules/modules/gpio-sunxi.ko:root/gpio-sunxi.ko

# wifi & bt config file
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# egl
PRODUCT_COPY_FILES += \
	device/mixtile/loftq/sensors.sh:system/bin/sensors.sh

# touch screen
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# usb accessory
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
PRODUCT_PACKAGES += \
        com.android.future.usb.accessory

# usb host
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# GPU buffer size configs
PRODUCT_COPY_FILES += \
        device/mixtile/loftq/configs/powervr.ini:system/etc/powervr.ini

#key and tp config file
PRODUCT_COPY_FILES += \
        device/mixtile/loftq/configs/sw-keyboard.kl:system/usr/keylayout/sw-keyboard.kl \
        device/mixtile/loftq/configs/tp.idc:system/usr/idc/tp.idc \
        device/mixtile/loftq/configs/gsensor.cfg:system/usr/gsensor.cfg \
        device/mixtile/loftq/configs/sun6i-ir.kl:system/usr/keylayout/sun6i-ir.kl

#copy touch and keyboard driver to recovery randisk
PRODUCT_COPY_FILES += \
        device/mixtile/loftq/modules/modules/sw-keyboard.ko:obj/keyboard.ko \
        device/mixtile/loftq/modules/modules/sw_device.ko:obj/sw_device.ko \

# media codecs
PRODUCT_COPY_FILES += \
	device/mixtile/loftq/media_codecs.xml:system/etc/media_codecs.xml \

# wfd no invite
PRODUCT_COPY_FILES += \
    	device/mixtile/loftq/wfd_blacklist.conf:system/etc/wfd_blacklist.conf

#recovery config
PRODUCT_COPY_FILES += \
        device/mixtile/loftq/recovery.fstab:recovery.fstab

PRODUCT_PROPERTY_OVERRIDES += \
        persist.sys.timezone=Asia/Shanghai \
        persist.sys.language=zh \
        persist.sys.country=CN

PRODUCT_PROPERTY_OVERRIDES += \
        config.disable_telephony=true

# camera
PRODUCT_COPY_FILES += \
        device/mixtile/loftq/configs/camera.cfg:system/etc/camera.cfg \
        device/mixtile/loftq/configs/media_profiles.xml:system/etc/media_profiles.xml \
        frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
        frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
        frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
        device/mixtile/loftq/configs/cameralist.cfg:system/etc/cameralist.cfg

PRODUCT_PROPERTY_OVERRIDES += \
        ro.sf.lcd_density=160 \
        ro.sf.showhdmisettings=7 \
        persist.sys.ui.hw=true \
        persist.sys.usb.config=mass_storage,adb \
        ro.product.firmware=v4.4.2 \
        ro.udisk.lable=loftq \
        ro.softmouse.left.code=6 \
        ro.softmouse.right.code=14 \
        ro.softmouse.top.code=67 \
        ro.softmouse.bottom.code=10 \
        ro.softmouse.leftbtn.code=2 \
        ro.softmouse.midbtn.code=-1 \
        ro.softmouse.rightbtn.code=-1 \
        audio.output.active=AUDIO_CODEC \
        audio.input.active=AUDIO_CODEC

PRODUCT_PROPERTY_OVERRIDES += \
        ro.carrier=wifi-only \
    	ro.sw.directlypoweroff=false

DEVICE_PACKAGE_OVERLAYS := \
        device/mixtile/loftq/overlay \
        $(DEVICE_PACKAGE_OVERLAYS)

# file system management
PRODUCT_PACKAGES += \
    e2fsck 

PRODUCT_PACKAGES += \
    nvram \
    ap6234 

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product-if-exists, device/mixtile/loftq/sun6i/sun6i.mk)
$(call inherit-product-if-exists, device/mixtile/loftq/modules/modules.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/ap6234/device-bcm.mk)

