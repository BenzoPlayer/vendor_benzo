include vendor/benzo/configs/benzo_config.mk
include vendor/benzo/configs/benzo_extras.mk
include vendor/benzo/configs/versions.mk

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.wifi-watchlist=GoogleGuest
