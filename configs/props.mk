#
# Copyright (C) 2022 Cygnus
# SPDX-License-Identifer: Apache-2.0
#

# Blurs
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1

# Override undesired Google defaults
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.require_network=any \
    ro.setupwizard.mode=OPTIONAL \
    ro.opa.eligible_device=true

#SeLinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += net.tethering.noprovisioning=true

# Don't Hide APNs
PRODUCT_PROPERTY_OVERRIDES += persist.sys.hideapn=false

ifeq ($(CYGNUS_BUILD_TYPE),OFFICIAL)
   PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
       ro.cygnus.build.number=$(CYGNUS_BUILD_NUMBER)-OFF
   else
       PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
         ro.cygnus.build.number=$(CYGNUS_BUILD_NUMBER)-UNOFF
endif
