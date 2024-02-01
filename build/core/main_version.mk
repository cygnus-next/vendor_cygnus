# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# CygnusOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.cygnus.version=$(CYGNUS_VERSION) \
    ro.cygnus.releasetype=$(CYGNUS_BUILDTYPE) \
    ro.cygnus.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(CYGNUS_VERSION) \
    ro.cygnuslegal.url=https://cygnusos.org/legal

# CygnusOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.cygnus.display.version=$(CYGNUS_DISPLAY_VERSION)

# CygnusOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.cygnus.build.version.plat.sdk=$(CYGNUS_PLATFORM_SDK_VERSION)

# CygnusOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.cygnus.build.version.plat.rev=$(CYGNUS_PLATFORM_REV)
