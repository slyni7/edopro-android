LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := git2
LOCAL_STATIC_LIBRARIES := libssl libcrypto
LOCAL_SRC_FILES := ./lib/$(TARGET_ARCH_ABI)/libgit2.a

include $(PREBUILT_STATIC_LIBRARY)

$(call import-add-path,$(LOCAL_PATH)/..)
$(call import-module,openssl)