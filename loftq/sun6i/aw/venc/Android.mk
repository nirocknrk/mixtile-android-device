LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
include $(LOCAL_PATH)/../Config.mk

LOCAL_CFLAGS += $(AW_OMX_EXT_CFLAGS)
LOCAL_CFLAGS += -D__OS_ANDROID
LOCAL_CFLAGS += -D__CHIP_VERSION_F23
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES:= neon_rgb2yuv.s omx_venc.cpp

LOCAL_C_INCLUDES := \
	$(TOP)/frameworks/native/include/media/hardware \
    $(SUN6I_AW_TOP)/../hardware/include \
	$(SUN6I_AW_TOP) \
	$(SUN6I_AW_TOP)/ion \
	$(SUN6I_AW_TOP)/include \
	$(SUN6I_AW_TOP)/omxcore/inc/ \
	$(SUN6I_AW_TOP)/venc \
	$(SUN6I_AW_TOP)/vencode/h264encLib/include \
	$(CEDARX_TOP)/include/include_vencoder \
	$(CEDARX_TOP)/include

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	liblog \
	libdl \
	libbinder \
	libcedarxosal \
	libaw_h264enc \
	libcedarxbase \
	libui \
	libcedarxosal \
	libion \
    libsunxi_ion
				

LOCAL_MODULE:= libOmxVenc

include $(BUILD_SHARED_LIBRARY)
