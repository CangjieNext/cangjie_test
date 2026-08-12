/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn13.h"

#include <stdint.h>

typedef int32_t* (*testfunc1)();

int32_t* func1()
{
    return 0;
}

JNIEXPORT jlong JNICALL Java_BenchmarkCffiReturn13_testFunc(JNIEnv*, jclass)
{
    testfunc1 ret = &func1;
    return (jlong)ret;
}
