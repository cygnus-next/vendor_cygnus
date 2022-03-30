#
# Copyright (C) 2022 Cygnus
# SPDX-License-Identifer: Apache-2.0
#
CYGNUS_PATH := vendor/cygnus

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Disable EAP Proxy because it depends on proprietary headers
# and breaks WPA Supplicant compilation.
DISABLE_EAP_PROXY := true

# Permissions
PRODUCT_COPY_FILES += \
    $(CYGNUS_PATH)/configs/permissions/privapp-permissions-google-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google.xml \
    $(CYGNUS_PATH)/configs/permissions/privapp-permissions-google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-google.xml

# Include support for GApps backup
PRODUCT_COPY_FILES += \
    $(CYGNUS_PATH)/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    $(CYGNUS_PATH)/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    $(CYGNUS_PATH)/prebuilt/bin/50-backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    $(CYGNUS_PATH)/prebuilt/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    $(CYGNUS_PATH)/prebuilt/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    $(CYGNUS_PATH)/prebuilt/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Cygnus Init
PRODUCT_COPY_FILES += \
    $(CYGNUS_PATH)/prebuilt/root/init.cygnus.rc:$(TARGET_COPY_OUT_ROOT)/init.cygnus.rc

# Hostapd configuration
PRODUCT_COPY_FILES += \
    $(CYGNUS_PATH)/prebuilt/etc/hostapd/hostapd_default.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/hostapd/hostapd_default.conf \
    $(CYGNUS_PATH)/prebuilt/etc/hostapd/hostapd.deny:$(TARGET_COPY_OUT_SYSTEM)/etc/hostapd/hostapd.deny \
    $(CYGNUS_PATH)/prebuilt/etc/hostapd/hostapd.accept:$(TARGET_COPY_OUT_SYSTEM)/etc/hostapd/hostapd.accept

# APN
PRODUCT_COPY_FILES += \
    $(CYGNUS_PATH)/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include $(CYGNUS_PATH)/sdclang/sdclang.mk
endif

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Disable Java debug info
USE_DEX2OAT_DEBUG := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

ifeq ($(WITH_GAPPS),true)
      $(call inherit-product-if-exists, vendor/gms/products/gms.mk)
endif

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true

# Flatten APEXs for performance
OVERRIDE_TARGET_FLATTEN_APEX := true
# This needs to be specified explicitly to override ro.apex.updatable=true from
# prebuilt vendors, as init reads /product/build.prop after /vendor/build.prop
PRODUCT_PRODUCT_PROPERTIES += ro.apex.updatable=false

#Additonal Flags
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
WITH_DEXPREOPT_DEBUG_INFO := false
USE_DEX2OAT_DEBUG := false
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

include $(CYGNUS_PATH)/utils.mk
$(call inherit-product, vendor/cygnus/configs/props.mk)
$(call inherit-product, vendor/cygnus-overlays/overlays.mk)
$(call inherit-product, device/cygnus/common/common.mk)
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, vendor/cygnus/configs/packages.mk)
$(call inherit-product, vendor/cygnus/configs/bootanim.mk)
