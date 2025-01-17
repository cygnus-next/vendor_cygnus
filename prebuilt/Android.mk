# Copyright (C) 2020 Cygnus
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

LOCAL_PATH := $(call my-dir)

#
# Prebuilt APKs
#
#FileManager App
include $(CLEAR_VARS)
LOCAL_MODULE := MiXplorerPrebuilt
LOCAL_SRC_FILES := common/app/MiXplorerPrebuilt.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := CMFileManager Amaze AmazeFM crDroidFileManager	
include $(BUILD_PREBUILT)

#Retro Music Player
include $(CLEAR_VARS)
LOCAL_MODULE := RetroMusicPlayer
LOCAL_SRC_FILES := common/app/RetroMusicPlayer.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := Music SnapdragonMusic crDroidMusic Phonograph Eleven VanillaMusic
include $(BUILD_PREBUILT)

#Pixel Launcher
include $(CLEAR_VARS)
LOCAL_MODULE := PixelLauncher
LOCAL_SRC_FILES := common/priv-app/Launcher/Launcher.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := Launcher2 Launcher3 Launcher3QuickStep QuickStep
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false

# Via
include $(CLEAR_VARS)
LOCAL_MODULE := ViaBrowser
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := common/app/ViaBrowser.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_CERTIFICATE := PRESIGNED
include $(BUILD_PREBUILT)
