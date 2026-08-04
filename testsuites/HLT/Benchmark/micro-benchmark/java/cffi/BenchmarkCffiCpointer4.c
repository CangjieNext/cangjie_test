/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiCpointer4.h"

#include <stdint.h>

typedef void* (*testfunc1)();

void* func1()
{
    return 0;
}

JNIEXPORT jlong JNICALL Java_BenchmarkCffiCpointer4_cfuncPtr(JNIEnv*, jclass)
{
    void* (*ret)(void*) = &func1;
    return (jlong)ret;
}

JNIEXPORT jint JNICALL Java_BenchmarkCffiCpointer4_testFunc(
    JNIEnv*, jclass, jlong func1, jlong func2, jlong func3, jlong func4)
{
    ((testfunc1)func1)();
    ((testfunc1)func2)();
    ((testfunc1)func3)();
    ((testfunc1)func4)();
    return 0;
}
