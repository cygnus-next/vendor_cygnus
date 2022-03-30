#
# Copyright (C) 2022 Vaisakh Murali
# SPDX-License-Identifer: Apache-2.0
#
LOCAL_FONT_PATH := vendor/cygnus/fonts

PRODUCT_COPY_FILES += \
	$(LOCAL_FONT_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \
	$(call find-copy-subdir-files,*,$(LOCAL_FONT_PATH)/Inter,$(TARGET_COPY_OUT_PRODUCT)/fonts)
