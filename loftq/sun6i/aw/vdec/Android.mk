LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
include $(LOCAL_PATH)/../Config.mk

LOCAL_CFLAGS += $(AW_OMX_EXT_CFLAGS)
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES:= omx_vdec.cpp transform_color_format.c

LOCAL_C_INCLUDES := \
	$(SUN6I_AW_TOP)\
	$(SUN6I_AW_TOP)/include \
	$(SUN6I_AW_TOP)/omxcore/inc \
	$(SUN6I_AW_TOP)/vdec \
	$(TOP)/frameworks/native/include  \
	$(CEDARX_TOP)/include     \
	$(CEDARX_TOP)/include/include_cedarv     \

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	libbinder \
	libcedarxosal \
	libcedarv \
	libui       \
	libdl \
	libcedarxbase \
	

#libvdecoder
LOCAL_MODULE:= libOmxVdec

include $(BUILD_SHARED_LIBRARY)
