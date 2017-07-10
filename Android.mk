LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    src/lib/decompress/zstd_decompress.c \
    src/lib/decompress/huf_decompress.c \
    src/lib/common/zstd_common.c \
    src/lib/common/threading.c \
    src/lib/common/fse_decompress.c \
    src/lib/common/xxhash.c \
    src/lib/common/error_private.c \
    src/lib/common/pool.c \
    src/lib/common/entropy_common.c \
    src/lib/compress/fse_compress.c \
    src/lib/compress/zstd_compress.c \
    src/lib/compress/zstdmt_compress.c \
    src/lib/compress/huf_compress.c \
    src/lib/legacy/zstd_v04.c \
    src/lib/legacy/zstd_v05.c \
    src/lib/legacy/zstd_v06.c \
    src/lib/legacy/zstd_v07.c \
    src/lib/dictBuilder/cover.c \
    src/lib/dictBuilder/zdict.c \
    src/lib/dictBuilder/divsufsort.c

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/src/lib/common \
    $(LOCAL_PATH)/src/lib/compress \
    $(LOCAL_PATH)/src/lib/dictBuilder \
    $(LOCAL_PATH)/src/lib/legacy \
    $(LOCAL_PATH)/src/lib

LOCAL_CFLAGS += -DXXH_NAMESPACE=ZSTD_
LOCAL_CFLAGS += -DZSTD_MULTITHREAD
LOCAL_CFLAGS += -DZSTD_LEGACY_SUPPORT=4
LOCAL_CFLAGS += -O3
LOCAL_CFLAGS += -pthread
LOCAL_CFLAGS += -lz

LOCAL_MODULE:= zstd
LOCAL_MODULE_FILENAME := libzstd

include $(BUILD_STATIC_LIBRARY)
