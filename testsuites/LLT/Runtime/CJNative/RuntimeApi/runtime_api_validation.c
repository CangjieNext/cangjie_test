/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "runtime_api_test.h"

static void* NeverExecutedTask(void* arg)
{
    return arg;
}

static void ExpectInvalidConfig(struct RuntimeParam* param)
{
    assert(InitCJRuntime(param) == E_ARGS);
    memset(param, 0, sizeof(*param));
    param->logParam.logLevel = RTLOG_OFF;
}

int main(void)
{
    struct RuntimeParam param = {0};
    param.logParam.logLevel = RTLOG_OFF;

    assert(FiniCJRuntime() == E_FAILED);
    assert(SetCJCommandLineArgs(0, NULL) == E_FAILED);
    assert(InitUIScheduler() == NULL);
    assert(RunUIScheduler(1) == E_FAILED);
    assert(RunCJTask(NeverExecutedTask, NULL) == NULL);
    assert(InitCJLibrary("missing.dylib") == E_ARGS);
    assert(LoadCJLibrary(NULL) == E_ARGS);
    assert(LoadCJLibrary("missing-runtime-api-library.dylib") == E_ARGS);
    assert(FindCJSymbol(NULL, "symbol") == NULL);
    assert(FindCJSymbol("missing.dylib", NULL) == NULL);
    assert(UnloadCJLibrary(NULL) == E_ARGS);
    assert(UnloadCJLibrary("missing-runtime-api-library.dylib") == E_ARGS);

    param.coParam.coStackSize = 1;
    ExpectInvalidConfig(&param);
    param.coParam.coStackSize = 1024U * 1024U + 1U;
    ExpectInvalidConfig(&param);
    param.heapParam.heapSize = 1;
    ExpectInvalidConfig(&param);
    param.heapParam.regionSize = 1;
    ExpectInvalidConfig(&param);
    param.heapParam.regionSize = 2049;
    ExpectInvalidConfig(&param);
    param.heapParam.exemptionThreshold = -0.1;
    ExpectInvalidConfig(&param);
    param.heapParam.heapUtilization = -0.1;
    ExpectInvalidConfig(&param);
    param.gcParam.garbageThreshold = -0.1;
    ExpectInvalidConfig(&param);
    param.gcParam.garbageThreshold = 1.1;
    ExpectInvalidConfig(&param);

    param.heapParam.regionSize = 128;
    param.heapParam.heapSize = 64U * 1024U;
    param.heapParam.exemptionThreshold = 0.7;
    param.heapParam.heapUtilization = 0.75;
    param.heapParam.heapGrowth = 0.2;
    param.heapParam.allocationRate = 2048.0;
    param.heapParam.allocationWaitTime = 2000;
    param.gcParam.gcThreshold = 32U * 1024U;
    param.gcParam.garbageThreshold = 0.6;
    param.gcParam.gcInterval = 100;
    param.gcParam.backupGCInterval = 10;
    param.gcParam.gcThreads = 2;
    param.coParam.thStackSize = 1024;
    param.coParam.coStackSize = 128;
    param.coParam.processorNum = 2;

    assert(InitCJRuntime(&param) == E_OK);
    assert(InitCJRuntime(&param) == E_OK);

    const char* args[] = {"runtime_api_validation", "argument"};
    assert(SetCJCommandLineArgs(0, args) == E_OK);
    assert(SetCJCommandLineArgs(1, NULL) == E_OK);
    assert(SetCJCommandLineArgs(2, args) == E_OK);

    assert(FiniCJRuntime() == E_OK);
    assert(FiniCJRuntime() == E_OK);
    assert(InitCJRuntime(&param) == E_FAILED);
    assert(RunCJTask(NeverExecutedTask, NULL) == NULL);

    puts("runtime api validation pass");
    return 0;
}
