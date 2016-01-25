# System
export USE_HOST_LEX := yes
export USE_CCACHE := 1
export USE_SYSTEM_CCACHE := 1
export BLOCK_BUILD := true

# Target device
export TARGET_DEVICE := fugu

# Build
export ANDROID_COMPILE_WITH_JACK := false
export DISABLE_OPTIMIZATIONS := false
ifneq ($(DISABLE_OPTIMIZATIONS),true)
export FORCE_DISABLE_DEBUGGING := true
export ENABLE_IPA_ANALYSER := true
export TARGET_USE_PIPE := true
export ENABLE_PTHREAD := false
export ENABLE_GOMP := false
export GRAPHITE_OPTS := true
export ENABLE_EXTRAGCC := true
endif

# Toolchain and other
export TARGET_NDK_GCC_VERSION := 4.9
export TARGET_GCC_VERSION_EXP := 4.9
export TARGET_GCC_VERSION := 4.9

# benzoCore
export KBUILD_BUILD_USER := xanaxdroid
export KBUILD_BUILD_HOST := benzo

# Prop Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    debug.performance.tuning=1 \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    windowsmgr.max_events_per_sec=150

