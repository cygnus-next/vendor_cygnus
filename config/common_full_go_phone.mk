# Set Cygnus specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Cygnus stuff
$(call inherit-product, vendor/cygnus/config/common_full_phone.mk)
