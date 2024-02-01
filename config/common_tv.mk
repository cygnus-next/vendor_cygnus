# Inherit common Cygnus stuff
$(call inherit-product, vendor/cygnus/config/common.mk)

# Inherit Cygnus atv device tree
$(call inherit-product, device/cygnus/atv/cygnus_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Cygnus packages
PRODUCT_PACKAGES += \
    CygnusCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/cygnus/overlay/tv
