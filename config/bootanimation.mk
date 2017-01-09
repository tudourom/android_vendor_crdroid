ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ "$(TARGET_SCREEN_WIDTH)" -lt "$(TARGET_SCREEN_HEIGHT)" ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# determine the bigger dimension
TARGET_BOOTANIMATION_SIZE_ALT := $(shell \
  if [ "$(TARGET_SCREEN_WIDTH)" -gt "$(TARGET_SCREEN_HEIGHT)" ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# first try matching and use smaller dimension bootanimation
ifneq ($(filter 720 1080 1440,$(TARGET_BOOTANIMATION_SIZE)),)
PRODUCT_BOOTANIMATION := vendor/cm/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_SIZE).zip
else
# if not try matching and use bigger dimension bootanimation
ifneq ($(filter 720 1080 1440,$(TARGET_BOOTANIMATION_SIZE_ALT)),)
PRODUCT_BOOTANIMATION := vendor/cm/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_SIZE_ALT).zip
else
# if not found use default bootanimation
PRODUCT_BOOTANIMATION := vendor/cm/prebuilt/common/bootanimation/bootanimation.zip
endif
endif

else
PRODUCT_BOOTANIMATION := vendor/cm/prebuilt/common/bootanimation/bootanimation.zip
endif
