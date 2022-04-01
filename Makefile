CONFIG_MODULE_SIG=n # 不签名模块
KBUILD_EXTRA_SYMBOLS=/home/ssage/Desktop/MiKernel/Modules/Mi_10_U_Res/Module.symvers # ??symbols?crc

MODULE_NAME := hwBreakpointProc
RESMAN_CORE_OBJS:=sys.o
RESMAN_GLUE_OBJS:=cvector.o

ifneq ($(KERNELRELEASE),)    
	$(MODULE_NAME)-objs:=$(RESMAN_GLUE_OBJS) $(RESMAN_CORE_OBJS)
	obj-m := hwBreakpointProc.o
else
	KDIR :=/home/ssage/Desktop/MiKernel/cmi-r-oss/out
	PWD := $(shell pwd)
	ARCH=arm64
all:
	make -C $(KDIR) ARCH=$(ARCH) CROSS_COMPILE=/home/ssage/Desktop/ToolChains/aarch64-linux-android-4.9-uber-master/bin/aarch64-linux-android- CC=/home/ssage/Desktop/ToolChains/toolchains/llvm-Snapdragon_LLVM_for_Android_8.0/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- M=${PWD} modules
	rm -rf .*.o.d *.o *.mod.c .*.cmd .tmp_versions *.order *.symvers
	
clean:    
	rm -rf .*.o.d *.o  *.ko *.mod.c .*.cmd .tmp_versions *.order *.symvers
	
endif
