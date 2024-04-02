ARCHS := arm64
TARGET := iphone:clang:latest:15.0

include $(THEOS)/makefiles/common.mk

XCODEPROJ_NAME += StatusMagic

include $(THEOS_MAKE_PATH)/xcodeproj.mk

before-package::
	$(ECHO_NOTHING)ldid -SStatusMagic/StatusMagic.entitlements $(THEOS_STAGING_DIR)/Applications/StatusMagic.app$(ECHO_END)

after-install::
	install.exec "[[ -e /var/jb ]] && uicache -p /var/jb/Applications/StatusMagic.app || uicache -p /Applications/StatusMagic.app"