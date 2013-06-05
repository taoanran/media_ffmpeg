#
# Copyright (C) 2008 The Android Open Source Project
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
#
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := cmdutils.c \
    ffmpeg.c

LOCAL_C_INCLUDES := $(LOCAL_PATH) \
    $(LOCAL_PATH)/libavcodec \
    $(LOCAL_PATH)/libavdevice \
    $(LOCAL_PATH)/libavfilter \
    $(LOCAL_PATH)/libavformat \
    $(LOCAL_PATH)/libavutil \
    $(LOCAL_PATH)/libpostproc \
    $(LOCAL_PATH)/libswscale

LOCAL_MODULE_TAGS = optional
LOCAL_SHARED_LIBRARIES := libcutils \
    libutils \
    libffmpeg
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := ffmpeg 
include $(BUILD_EXECUTABLE)
