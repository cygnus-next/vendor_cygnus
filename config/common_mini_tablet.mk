# Inherit mini common Cygnus stuff
$(call inherit-product, vendor/cygnus/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/cygnus/config/telephony.mk)
