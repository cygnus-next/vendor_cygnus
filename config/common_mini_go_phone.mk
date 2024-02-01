# Set Cygnus specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Cygnus stuff
$(call inherit-product, vendor/cygnus/config/common_mini_phone.mk)
