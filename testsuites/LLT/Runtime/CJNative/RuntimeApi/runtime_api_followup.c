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
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "runtime_api_test.h"

#if defined(__APPLE__)
static const char* CJ_LIBRARY = "libruntime_api_followup.dylib";
static const char* PLAIN_LIBRARY = "libruntime_api_plain.dylib";
#elif defined(_WIN32)
static const char* CJ_LIBRARY = "runtime_api_followup.dll";
static const char* PLAIN_LIBRARY = "runtime_api_plain.dll";
#else
static const char* CJ_LIBRARY = "libruntime_api_followup.so";
static const char* PLAIN_LIBRARY = "libruntime_api_plain.so";
#endif

struct RuntimeApiTlsPayload {
    uint32_t key;
    void* value;
};

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

static void CheckDemangle(void)
{
    char* simple = CJ_MRT_DemangleHandle("_CN7default19function_funcTest_1Ev");
    assert(simple != NULL);
    assert(strstr(simple, "function_funcTest_1") != NULL);
    free(simple);

    char* generic = CJ_MRT_DemangleHandle("_CN13pkg$pkg1$pkg28pkg2_arrIlE");
    assert(generic != NULL);
    assert(strstr(generic, "pkg2_arr") != NULL);
    free(generic);

    char* withoutTi =
        CJ_MRT_DemangleHandle("_CN7default19function_funcTest_1Ev$withoutTI");
    assert(withoutTi != NULL);
    assert(strstr(withoutTi, "function_funcTest_1") != NULL);
    free(withoutTi);
}

static int RunCoreMode(void)
{
    struct RuntimeParam param = {0};
    param.logParam.logLevel = RTLOG_OFF;
    assert(InitCJRuntime(&param) == E_OK);
    assert(LoadCJLibraryWithInit(CJ_LIBRARY) == E_OK);

    CJTaskFunc immediate =
        (CJTaskFunc)FindCJSymbol(CJ_LIBRARY, "RuntimeApiFollowupImmediate");
    CJTaskFunc slow =
        (CJTaskFunc)FindCJSymbol(CJ_LIBRARY, "RuntimeApiFollowupSlow");
    CJTaskFunc tls =
        (CJTaskFunc)FindCJSymbol(CJ_LIBRARY, "RuntimeApiFollowupTls");
    assert(immediate != NULL && slow != NULL && tls != NULL);

    int value = 73;
    void* result = NULL;
    CJThreadKey key = 0;
    assert(CJThreadKeyCreate(&key, NULL) == E_OK);
    struct CJThreadSpecificData local = {.key = key, .value = &value};

    assert(RunCJTaskWithLocal(immediate, &value, &local, -1) == NULL);
    assert(CreateCJThread(immediate, &value, &local, -1) == NULL);

    CJThreadHandle future = RunCJTask(immediate, &value);
    assert(future != NULL);
    SleepForMilliseconds(20);
    assert(GetTaskRetWithTimeout(future, &result, 1000000000LL) == E_OK);
    assert(result == &value);
    ReleaseHandle(future);
    assert(GetTaskRetWithTimeout(future, &result, 1) == E_ARGS);

    future = RunCJTask(slow, &value);
    assert(future != NULL);
    assert(GetTaskRetWithTimeout(future, &result, 1000000000LL) == E_OK);
    assert(result == &value);
    ReleaseHandle(future);

    struct RuntimeApiTlsPayload payload = {.key = key, .value = &value};
    future = RunCJTaskWithLocal(tls, &payload, &local, 1);
    assert(future != NULL);
    assert(GetTaskRet(future, &result) == E_OK);
    assert(result == &value);
    ReleaseHandle(future);

    int directSet = CJThreadSetspecific(key, &value);
    if (directSet == E_OK) {
        assert(CJThreadGetspecific(key) == &value);
    } else {
        assert(CJThreadGetspecific(key) == NULL);
    }
    (void)AnyTask();
    CheckDemangle();

    assert(LoadCJLibrary(PLAIN_LIBRARY) == E_OK);
    assert(FindCJSymbol(PLAIN_LIBRARY, "RuntimeApiPlainFunction") != NULL);
    assert(UnloadCJLibrary(PLAIN_LIBRARY) == E_OK);
    assert(LoadCJLibraryWithInit(PLAIN_LIBRARY) == E_ARGS);
    assert(UnloadCJLibrary(PLAIN_LIBRARY) == E_ARGS);

    assert(UnloadCJLibrary(CJ_LIBRARY) == E_OK);
    assert(FiniCJRuntime() == E_OK);
    return 0;
}

static int RunUiMode(void)
{
    struct RuntimeParam param = {0};
    param.logParam.logLevel = RTLOG_OFF;
    assert(InitCJRuntime(&param) == E_OK);
    assert(InitUIScheduler() != NULL);
    assert(RunUIScheduler(1000000ULL) == E_OK);
    return 0;
}

int main(int argc, char** argv)
{
    assert(argc == 2);
    if (strcmp(argv[1], "core") == 0) {
        assert(RunCoreMode() == 0);
    } else if (strcmp(argv[1], "ui") == 0) {
        assert(RunUiMode() == 0);
    } else {
        return 2;
    }
    puts("runtime api followup pass");
    return 0;
}
