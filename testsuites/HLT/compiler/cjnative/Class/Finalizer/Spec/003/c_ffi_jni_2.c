/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#if defined(__linux__) || defined(__hm__) || defined(__APPLE__)
#include "unistd.h"
#include <sys/syscall.h>
#include <pthread.h>
#define gettid() syscall(__NR_gettid)
#else
#include "windows.h"
#endif

#if defined(__APPLE__)
int testfunc()
{
    uint64_t tid;
    pthread_threadid_np(NULL, &tid);
    return tid;
}
#elif defined(__linux__) || defined(__hm__)
int testfunc()
{
    return (int)gettid();
}
#else
int testfunc()
{
    return GetCurrentThreadId();
}
#endif
