# Copyright (C) 2023 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Alert Slider
PRODUCT_PACKAGES += \
    KeyHandler \
    tri-state-key-calibrate

# Attestation
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# Audio
PRODUCT_PACKAGES += \
    libstdc++.vendor

PRODUCT_VENDOR_PROPERTIES += \
    ro.config.vc_call_vol_steps=9 \
    persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24

PRODUCT_ODM_PROPERTIES += \
    ro.vendor.audio.sdk.fluencetype=fluence \
    persist.vendor.audio.bcl.enabled=false \
    persist.vendor.audio.fluence.voicerec=true \
    persist.vendor.audio.speaker.prot.enable=false \
    persist.vendor.audio.spv4.enable=false \
    persist.vendor.audio.vbat.enabled=false \
    vendor.audio.feature.spkr_prot.enable=false \
    vendor.audio.hal.output.suspend.supported=false

# Biometrics
TARGET_USES_FOD_ZPOS := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.oplus

PRODUCT_ODM_PROPERTIES += \
    persist.vendor.fp.template_updateflag=V1

# Bluetooth
PRODUCT_VENDOR_PROPERTIES += \
    persist.sys.fflag.override.settings_bluetooth_hearing_aid=true \
    persist.vendor.bluetooth.modem_nv_support=true \
    persist.vendor.qcom.bluetooth.a2dp_mcast_test.enabled=false \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptiver2 \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aptxadaptiver2_1_support=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    vendor.hw.fm.init=0

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Camera
$(call inherit-product-if-exists, vendor/oplus/camera/opluscamera.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# DPM
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpm.idletimer.mode=default \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.common-V1-ndk.vendor

PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.disable_backpressure=1 \
    debug.sf.frame_rate_multiple_threshold=60 \
    ro.surface_flinger.refresh_rate_switching=true \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=4000 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    vendor.display.primary_mixer_stages=9

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.sys.brightness.low.gamma=true

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# GPS
LOC_HIDL_VERSION = 4.0
TARGET_GPS_COMPONENT_VARIANT := gps

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

PRODUCT_VENDOR_PROPERTIES += \
    vendor.gatekeeper.disable_spu=true

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

PRODUCT_PACKAGES += \
    fstab.default \
    init.oplus.rc \
    init.target.rc \
    ueventd.oplus.rc \
    init.oplus.post_boot.sh

PRODUCT_VENDOR_PROPERTIES += \
    vendor.post_boot.custom=true

# Keymaster
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key

PRODUCT_PACKAGES += \
   android.hardware.keymaster@4.1.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/oplus

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# Overlays
PRODUCT_PACKAGES += \
    AOSPAOPSM8350Frameworks \
    AOSPAOPSM8350SystemUI \
    OPSM8350CarrierConfig \
    OPSM8350Frameworks \
    OPSM8350Settings \
    OPSM8350SystemUI \
    WifiResTarget

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Performance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Platform
TARGET_BOARD_PLATFORM := lahaina

# QTEE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qteeconnector.retrying_interval=30 \
    persist.vendor.qteeconnector.retrying_timeout=2000

# QTI
TARGET_COMMON_QTI_COMPONENTS += \
    adreno \
    alarm \
    audio \
    av \
    bt \
    charging \
    display \
    gps \
    init \
    media \
    overlay \
    perf \
    qseecomd \
    telephony \
    usb \
    wfd \
    wlan

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.poweron_opt=1 \
    persist.vendor.radio.stack_id_1=1

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_COPY_FILES += \
    hardware/oplus/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_PACKAGES += \
    als_correction_service.OPSM8350 \
    android.hardware.sensors@2.1-service.oplus-multihal \
    libsensorndkbridge \
    sensors.oplus

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.sensors.allow_non_default_discovery=true \
    persist.vendor.sensors.on_change_sample_period=true \
    persist.vendor.sensors.sync_request=true

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.sensors.enable.mag_filter=true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30

# SOC Properties
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=QTI

# Storage
PRODUCT_VENDOR_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true \
    ro.incremental.enable=yes

$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor
$(call inherit-product, vendor/oneplus/sm8350-common/sm8350-common-vendor.mk)

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.oplus_sm8350

# VNDK
NEED_AIDL_NDK_PLATFORM_BACKEND := true

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v30/arm/arch-arm-armv7-a-neon/shared/vndk-core/libui.so:$(TARGET_COPY_OUT_VENDOR)/lib/libui-v30.so \
    prebuilts/vndk/v30/arm/arch-arm-armv7-a-neon/shared/vndk-sp/android.hardware.common-V1-ndk_platform.so:$(TARGET_COPY_OUT_VENDOR)/lib/android.hardware.common-V1-ndk_platform.so \
    prebuilts/vndk/v30/arm/arch-arm-armv7-a-neon/shared/vndk-sp/android.hardware.graphics.common-V1-ndk_platform.so:$(TARGET_COPY_OUT_VENDOR)/lib/android.hardware.graphics.common-V1-ndk_platform.so

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
