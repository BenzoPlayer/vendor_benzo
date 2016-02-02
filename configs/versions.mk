# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=MMB29U BUILD_ID=MMB29U BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

ANDROID_NAME := sixzeroone
export ANDROID_NAME

    CUSTOM_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    BENZO_POSTFIX := -$(shell date -u +%Y%m%d)

ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(TARGET_DEVICE)
OTA_DATE := $(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.benzo.version=$(ROM_VERSION) \
  ro.modversion=$(ROM_VERSION)

TARGET_DEVICE := fugu
export TARGET_DEVICE := fugu
