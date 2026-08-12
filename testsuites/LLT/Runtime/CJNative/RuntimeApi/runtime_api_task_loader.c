/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#ifndef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 200809L
#endif

#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <time.h>

#include "runtime_api_test.h"

#if defined(__APPLE__)
static const char* TEST_LIBRARY = "libruntime_api_task_loader.dylib";
#elif defined(_WIN32)
static const char* TEST_LIBRARY = "runtime_api_task_loader.dll";
#else
static const char* TEST_LIBRARY = "libruntime_api_task_loader.so";
#endif

static void SleepForMilliseconds(long milliseconds)
{
    struct timespec remaining = {
        .tv_sec = milliseconds / 1000,
        .tv_nsec = (milliseconds % 1000) * 1000000L,
    };
    int result;
    do {
        result = nanosleep(&remaining, &remaining);
    } while (result != 0 && errno == EINTR);
    assert(result == 0);
}

int main(void)
{
    struct RuntimeParam param = {0};
    param.logParam.logLevel = RTLOG_OFF;

    assert(InitCJRuntime(&param) == E_OK);
    assert(LoadCJLibraryWithInit(TEST_LIBRARY) == E_OK);
    assert(InitCJLibrary(NULL) == E_ARGS);
    assert(FindCJSymbol(NULL, "RuntimeApiImmediateTask") == NULL);
    assert(FindCJSymbol(TEST_LIBRARY, NULL) == NULL);
    assert(FindCJSymbol(TEST_LIBRARY, "missingSymbol") == NULL);

    CJTaskFunc slowTask = (CJTaskFunc)FindCJSymbol(TEST_LIBRARY, "RuntimeApiSlowTask");
    CJTaskFunc immediateTask = (CJTaskFunc)FindCJSymbol(TEST_LIBRARY, "RuntimeApiImmediateTask");
    assert(slowTask != NULL);
    assert(immediateTask != NULL);
    assert(RunCJTask(NULL, NULL) == NULL);
    assert(RunCJTaskToSchedule(immediateTask, NULL, NULL) == NULL);
    assert(GetTaskRet(NULL, NULL) == E_ARGS);
    assert(GetTaskRetWithTimeout(NULL, NULL, 1) == E_ARGS);
    ReleaseHandle(NULL);

    int value = 42;
    void* result = NULL;
    CJThreadHandle future = RunCJTask(slowTask, &value);
    assert(future != NULL);
    assert(GetTaskRetWithTimeout(future, &result, 1) == E_TIMEOUT);
    assert(GetTaskRet(future, &result) == E_OK);
    assert(result == &value);
    ReleaseHandle(future);
    ReleaseHandle(future);

    CJThreadKey key = 0;
    assert(CJThreadKeyCreate(&key, NULL) == E_OK);
    struct CJThreadSpecificData local = {.key = key, .value = &value};
    future = RunCJTaskWithLocal(immediateTask, &value, &local, 1);
    assert(future != NULL);
    assert(GetTaskRet(future, &result) == E_OK);
    assert(result == &value);
    ReleaseHandle(future);

    future = RunCJTask(slowTask, &value);
    assert(future != NULL);
    ReleaseHandle(future);
    SleepForMilliseconds(100);

    SemiCJThreadHandle semi = CreateCJThread(immediateTask, &value, NULL, 0);
    assert(semi != NULL);
    assert(GetCJThreadState(semi) == SEMI_CJTHREAD_INIT);
    assert(ResumeCJThread(semi) == E_OK);
    assert(GetCJThreadState(semi) == SEMI_CJTHREAD_DONE);
    assert(GetCJThreadResult(semi) == &value);
    assert(DestoryCJThread(semi) == E_OK);

    assert(UnloadCJLibrary(NULL) == E_ARGS);
    assert(UnloadCJLibrary("missing-runtime-api-library.dylib") == E_ARGS);
    assert(UnloadCJLibrary(TEST_LIBRARY) == E_OK);
    assert(FiniCJRuntime() == E_OK);

    puts("runtime task loader pass");
    return 0;
}
