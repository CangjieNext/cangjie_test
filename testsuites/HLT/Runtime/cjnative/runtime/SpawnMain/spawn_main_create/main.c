/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include "Cangjie.h"

void* g_ui_scheduler = NULL;

void SetUIScheduler(void* p);

long long CangjieFunc(int);

typedef bool (*PostTaskFunc)(void*);

typedef bool (*PostThreadTaskFunc)(void*, void*);

typedef bool (*HasHigherPriorityTaskFunc)();

typedef void (*RunTask)();

typedef void (*RunTaskInScheudleFunc)(void*);

RunTask taskList[100] = {NULL};

struct RunTaskInScheudle {
    RunTaskInScheudleFunc func;
    void* arg;
};

struct RunTaskInScheudle taskInScheduleList[100] = {NULL};

int index1 = 0;

bool postTask(void* taskFunc)
{
    if (taskFunc == NULL) {
        return false;
    }
    RunTask func = (RunTask)(taskFunc);
    taskList[index1] = func;
    index1++;
    return true;
}

bool hasHighTask()
{
    return false;
}

int main(int argc, char* argv[])
{
    struct RuntimeParam param = {.heapParam =
                                     {
                                         .regionSize = 64,
                                         .heapSize = 256 * 1024,
                                         .exemptionThreshold = 0.8,
                                         .heapUtilization = 0.8,
                                         .heapGrowth = 0.15,
                                         .allocationRate = 0,
                                         .allocationWaitTime = 0,
                                     },
                                 .gcParam =
                                     {
                                         .gcThreshold = 0,
                                         .garbageThreshold = 0,
                                         .gcInterval = 0,
                                         .backupGCInterval = 0,
                                         .gcThreads = 0,
                                     },
                                 .logParam =
                                     {
                                         .logLevel = RTLOG_ERROR,
                                     },
                                 .coParam = {
                                     .thStackSize = 2 * 1024,
                                     .coStackSize = 2 * 1024,
                                     .processorNum = 8,
                                 }};

    // 初始化Runtime及Default调度器，该调度器会在一个新的线程中开始运行
    InitCJRuntime(&param);
    RegisterEventHandlerCallbacks(postTask, hasHighTask);
    g_ui_scheduler = InitUIScheduler();

    // 加载一个仓颉的so，并初始化
#ifdef _WIN32
    const char* libname = "libuser.dll";
#else
    const char* libname = "libuser.so";
#endif
    LoadCJLibraryWithInit(libname);

    // 设置 UIScheduler
    SetUIScheduler(g_ui_scheduler);

    CangjieFunc(100);
    while (index1 != 0) {
        RunTask run = taskList[index1 - 1];
        run();
        index1--;
    }
    FiniCJRuntime();
    return 0;
}
