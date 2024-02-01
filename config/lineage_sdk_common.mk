# Permissions for cygnus sdk services
PRODUCT_COPY_FILES += \
    vendor/cygnus/config/permissions/org.cygnusos.globalactions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.cygnusos.globalactions.xml \
    vendor/cygnus/config/permissions/org.cygnusos.hardware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.cygnusos.hardware.xml \
    vendor/cygnus/config/permissions/org.cygnusos.health.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.cygnusos.health.xml \
    vendor/cygnus/config/permissions/org.cygnusos.livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.cygnusos.livedisplay.xml \
    vendor/cygnus/config/permissions/org.cygnusos.profiles.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.cygnusos.profiles.xml \
    vendor/cygnus/config/permissions/org.cygnusos.settings.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.cygnusos.settings.xml \
    vendor/cygnus/config/permissions/org.cygnusos.trust.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.cygnusos.trust.xml

# Cygnus Platform Library
PRODUCT_PACKAGES += \
    org.cygnusos.platform-res \
    org.cygnusos.platform

# AOSP has no support of loading framework resources from /system_ext
# so the SDK has to stay in /system for now
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/oat/%/org.cygnusos.platform.odex \
    system/framework/oat/%/org.cygnusos.platform.vdex \
    system/framework/org.cygnusos.platform-res.apk \
    system/framework/org.cygnusos.platform.jar

ifndef CYGNUS_PLATFORM_SDK_VERSION
  # This is the canonical definition of the SDK version, which defines
  # the set of APIs and functionality available in the platform.  It
  # is a single integer that increases monotonically as updates to
  # the SDK are released.  It should only be incremented when the APIs for
  # the new release are frozen (so that developers don't write apps against
  # intermediate builds).
  CYGNUS_PLATFORM_SDK_VERSION := 9
endif

ifndef CYGNUS_PLATFORM_REV
  # For internal SDK revisions that are hotfixed/patched
  # Reset after each CYGNUS_PLATFORM_SDK_VERSION release
  # If you are doing a release and this is NOT 0, you are almost certainly doing it wrong
  CYGNUS_PLATFORM_REV := 0
endif
