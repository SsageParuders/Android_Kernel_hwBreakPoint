#ifndef VER_CONTROL_H_
#define VER_CONTROL_H_
#include <linux/version.h>
#define DEV_FILENAME "hwBreakpointProc" //当前驱动DEV文件名

//独立内核模块入口模式
#define CONFIG_MODULE_GUIDE_ENTRY

//是否打印内核调试日志
#define CONFIG_DEBUG_PRINTK

#ifndef KERNEL_VERSION
#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
#endif
#ifndef LINUX_VERSION_CODE 
#define LINUX_VERSION_CODE KERNEL_VERSION(4,19,113) // Kernel内核版本控制
#endif

#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,83)
#include <linux/sched/task.h>
#include <linux/sched/mm.h>
#include <linux/sched/signal.h>
#endif

#if LINUX_VERSION_CODE <= KERNEL_VERSION(4,4,192)
#define FILE_OP_DIR_ITER iterate
#endif

#ifndef FILE_OP_DIR_ITER
#define FILE_OP_DIR_ITER iterate_shared
#endif

#ifdef CONFIG_DEBUG_PRINTK
#define printk_debug printk
#else
static inline void printk_debug(char *fmt, ...) {}
#endif

#endif /* VER_CONTROL_H_ */