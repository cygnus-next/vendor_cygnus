$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common Cygnus stuff
$(call inherit-product, vendor/cygnus/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Cygnus LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/cygnus/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/cygnus/overlay/dictionaries
