# Inherit full common Cygnus stuff
$(call inherit-product, vendor/cygnus/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Cygnus LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/cygnus/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/cygnus/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/cygnus/config/telephony.mk)
