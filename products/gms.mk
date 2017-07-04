###############################################################################
# GMS home folder location
# Note: we cannot use $(my-dir) in this makefile

ANDROID_PARTNER_GMS_HOME := vendor/google

# GMS mandatory core packages
PRODUCT_PACKAGES := \
    ConfigUpdater \
    GoogleBackupTransport \
    GoogleExtServices \
    GoogleExtShared \
    GoogleFeedback \
    GoogleLoginService \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GooglePrintRecommendationService \
    GoogleServicesFramework \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GmsCore \
    GmsCoreSetup

# GMS optional application packages
PRODUCT_PACKAGES += GoogleTTS
PRODUCT_PACKAGES += Phonesky
PRODUCT_PACKAGES += SetupWizardGoogle
PRODUCT_PACKAGES += WebViewGoogle

# GMS mandatory libraries
PRODUCT_PACKAGES += \
    com.google.android.maps.jar \
    com.google.android.media.effects.jar \
    com.google.android.dialer.support.jar

# Overlay For GMS devices
$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/sample/products/location_overlay.mk)
PRODUCT_PACKAGE_OVERLAYS += $(ANDROID_PARTNER_GMS_HOME)/products/gms_overlay

# Configuration files for GMS apps
PRODUCT_COPY_FILES += \
    $(ANDROID_PARTNER_GMS_HOME)/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/google.xml:system/etc/sysconfig/google.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/google_build.xml:system/etc/sysconfig/google_build.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/whitelist_com.android.omadm.service.xml:system/etc/sysconfig/whitelist_com.android.omadm.service.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/default-permissions/default-permissions.xml:system/etc/default-permissions/default-permissions.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/default-permissions/opengapps-permissions.xml:system/etc/default-permissions/opengapps-permissions.xml

# Overrides
PRODUCT_PROPERTY_OVERRIDES += \
      ro.com.google.clientidbase=android-google \
      ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
      ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
      ro.setupwizard.enterprise_mode=1 \
      ro.setupwizard.rotation_locked=true \
      ro.setupwizard.require_network=no \
      ro.setupwizard.mode=OPTIONAL \
      ro.com.google.ime.theme_id=5 \
      ro.opa.eligible_device=true

