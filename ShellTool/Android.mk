LOCAL_PATH := $(call my-dir) # 定义 local path 只需一次即可

#################################################

### 以下内容用于描述编译当前工程的源代码 ###

include $(CLEAR_VARS) # 声明 CLEAR_VARS 变量

LOCAL_MODULE := Kernel_hwBP_exec # 设定模块名称

LOCAL_CPPFLAGS += -std=c++1y
LOCAL_CFLAGS += -fPIE
LOCAL_CFLAGS += -fvisibility=hidden
LOCAL_LDFLAGS += -fPIE -pie
LOCAL_DISABLE_FATAL_LINKER_WARNINGS := true

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include # 添加头文件库路径

# 列举源文件
FILE_LIST := $(wildcard $(LOCAL_PATH)/src/*.c*)
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)

LOCAL_LDLIBS := -llog -lz # 链接系统库

include $(BUILD_EXECUTABLE)

### 当前工程的源代码编译完毕 ###

#################################################