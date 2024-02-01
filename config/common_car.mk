# Inherit common Cygnus stuff
$(call inherit-product, vendor/cygnus/config/common.mk)

# Inherit Cygnus car device tree
$(call inherit-product, device/cygnus/car/cygnus_car.mk)
