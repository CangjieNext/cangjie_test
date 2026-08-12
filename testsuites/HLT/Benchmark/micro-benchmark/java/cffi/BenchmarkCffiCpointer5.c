/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiCpointer5.h"

#include <malloc.h>
#include <stdint.h>

JNIEXPORT jlong JNICALL Java_BenchmarkCffiCpointer5_getPtr(JNIEnv*, jclass, jlong num)
{
    int64_t* ptr = (int64_t*)malloc(sizeof(int64_t));
    ptr[0] = num;
    return (jlong)ptr;
}

JNIEXPORT jint JNICALL Java_BenchmarkCffiCpointer5_testFunc(JNIEnv*, jclass, jlong param1)
{
    int32_t res = *(int64_t*)param1 * 2;
    return (jint)res;
}
