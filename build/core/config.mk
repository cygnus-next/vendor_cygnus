# Copyright (C) 2015 The CyanogenMod Project
#           (C) 2017-2018 The CygnusOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CYGNUS_SRC_API_DIR := $(TOPDIR)prebuilts/cygnus-sdk/api
INTERNAL_CYGNUS_PLATFORM_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/cygnus_public_api.txt
INTERNAL_CYGNUS_PLATFORM_REMOVED_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/cygnus_removed.txt
FRAMEWORK_CYGNUS_PLATFORM_API_FILE := $(TOPDIR)cygnus-sdk/api/cygnus_current.txt
FRAMEWORK_CYGNUS_PLATFORM_REMOVED_API_FILE := $(TOPDIR)cygnus-sdk/api/cygnus_removed.txt
FRAMEWORK_CYGNUS_API_NEEDS_UPDATE_TEXT := $(TOPDIR)vendor/cygnus/build/core/apicheck_msg_current.txt

# Rules for QCOM targets
include $(TOPDIR)vendor/cygnus/build/core/qcom_target.mk
