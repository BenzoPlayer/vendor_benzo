include vendor/benzo/configs/benzo_config.mk
include vendor/benzo/configs/benzo_extras.mk
include vendor/benzo/configs/versions.mk

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.wifi-watchlist=GoogleGuest

# Key layout files
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/usr/keylayout/AliTV_Remote_V1_Airmouse.kl:system/usr/keylayout/AliTV_Remote_V1_Airmouse.kl \
    vendor/benzo/prebuilt/usr/idc/AliTV_Remote_V1_Airmouse.idc:system/usr/idc/AliTV_Remote_V1_Airmouse.idc \


# Include our custom apps
PRODUCT_PACKAGES += \
    AppDrawer \
    BenzoCustomizer

