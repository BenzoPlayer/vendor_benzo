# Copyright (C) 2014-2015 The SaberMod Project
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

# Written for SaberMod toolchains
# TARGET_SM_AND can be set before this file to override the default of gcc 4.8 for ROM.
# This is to avoid hardcoding the gcc versions for the ROM and kernels.

 TARGET_SM_AND := $(TARGET_GCC_VERSION)

 # Set GCC colors
 export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

 # Find host os
 UNAME := $(shell uname -s)

 HOST_OS := linux

  TARGET_ARCH_LIB_PATH := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/x86/x86_64-linux-android-$(TARGET_SM_AND)/lib
  export TARGET_ARCH_LIB_PATH := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/x86/x86_64-linux-android-$(TARGET_SM_AND)/lib

  # Path to toolchain
  SM_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/x86/x86_64-linux-android-$(TARGET_SM_AND)
  SM_AND := $(shell cat $(SM_AND_PATH)/VERSION)

  # Find strings in version info
  SM_AND_NAME := $(filter %sabermod,$(SM_AND))
  SM_AND_DATE := $(filter 20140% 20141% 20150% 20151% 20160% 20161%,$(SM_AND))
  SM_AND_STATUS := $(filter (release) (prerelease) (experimental),$(SM_AND))
  SM_AND_VERSION := $(SM_AND_NAME)-$(SM_AND_DATE)-$(SM_AND_STATUS)

   # Write version info to build.prop
   PRODUCT_PROPERTY_OVERRIDES += \
     ro.sm.android=$(SM_AND_VERSION)

 # Add extra libs for the compilers to use
 export LD_LIBRARY_PATH := $(TARGET_ARCH_LIB_PATH):$(LD_LIBRARY_PATH)
 export LIBRARY_PATH := $(TARGET_ARCH_LIB_PATH):$(LIBRARY_PATH)

   OPT1 := (O3)

ifeq ($(GRAPHITE_OPTS),true)
   OPT2 := (graphite)
endif

ifeq ($(FORCE_DISABLE_DEBUGGING),true)
   OPT3 := (no-debug)
endif

ifeq ($(ENABLE_PTHREAD),true)
   OPT4 := (pthread)
endif

ifeq ($(ENABLE_GOMP),true)
   OPT5 := (openmp)
endif

# DragonTC Clang with Polly
   OPT6 := (polly)

ifeq (true,$(ENABLE_EXTRAGCC))
   OPT7 := (extras)
endif

  GCC_OPTIMIZATION_LEVELS := $(OPT1)$(OPT2)$(OPT3)$(OPT4)$(OPT5)$(OPT6)$(OPT7)

  ifneq ($(GCC_OPTIMIZATION_LEVELS),)
    PRODUCT_PROPERTY_OVERRIDES += \
      ro.sm.flags=$(GCC_OPTIMIZATION_LEVELS)
  endif
export GCC_OPTIMIZATION_LEVELS
