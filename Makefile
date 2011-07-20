include theos/makefiles/common.mk

TWEAK_NAME = LaunchNotifier
LaunchNotifier_FILES = Tweak.xm
LaunchNotifier_FRAMEWORKS = AVFoundation



include $(THEOS_MAKE_PATH)/tweak.mk
