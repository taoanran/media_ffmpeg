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
#LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/../config.mak  

OBJS :=  
OBJS-yes :=  
MMX-OBJS-yes :=  
include $(LOCAL_PATH)/Makefile  

# collect objects  
OBJS-$(HAVE_MMX) += $(MMX-OBJS-yes)  
OBJS += $(OBJS-yes)  

FFNAME := lib$(NAME)  
FFLIBS := $(foreach,NAME,$(FFLIBS),lib$(NAME))  
FFCFLAGS  = -DHAVE_AV_CONFIG_H -Wno-sign-compare -Wno-switch -Wno-pointer-sign -fPIC
FFCFLAGS += -DTARGET_CONFIG=\"config-$(TARGET_ARCH).h\"  

ALL_S_FILES := $(wildcard $(LOCAL_PATH)/$(TARGET_ARCH)/*.S)  
ALL_S_FILES := $(addprefix $(TARGET_ARCH)/, $(notdir $(ALL_S_FILES)))  

ifneq ($(ALL_S_FILES),)  
    ALL_S_OBJS := $(patsubst %.S,%.o,$(ALL_S_FILES))  
    C_OBJS := $(filter-out $(ALL_S_OBJS),$(OBJS))  
    S_OBJS := $(filter $(ALL_S_OBJS),$(OBJS))  
else  
    C_OBJS := $(OBJS)  
    S_OBJS :=  
endif  

C_FILES := $(patsubst %.o,%.c,$(C_OBJS))  
S_FILES := $(patsubst %.o,%.S,$(S_OBJS))  
FFFILES := $(sort $(S_FILES)) $(sort $(C_FILES))  
