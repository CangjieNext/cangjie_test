/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiCpointer6.h"

#include <malloc.h>
#include <stdint.h>

JNIEXPORT jlong JNICALL Java_BenchmarkCffiCpointer7_getPtr(JNIEnv*, jclass, jlong num)
{
    int64_t* ptr = (int64_t*)malloc(sizeof(int64_t));
    ptr[0] = num;
    return (jlong)ptr;
}

JNIEXPORT jint JNICALL Java_BenchmarkCffiCpointer7_testFunc(JNIEnv*, jclass, jlong param1, jlong param2, jlong param3,
    jlong param4, jlong param5, jlong param6, jlong param7, jlong param8, jlong param9, jlong param10, jlong param11,
    jlong param12, jlong param13, jlong param14, jlong param15, jlong param16)
{
    int32_t res = *(int64_t*)param1 + *(int64_t*)param2 + *(int64_t*)param3 - *(int64_t*)param4 + *(int64_t*)param5 +
        *(int64_t*)param6 + *(int64_t*)param7 - *(int64_t*)param8 - *(int64_t*)param9 + *(int64_t*)param10 +
        *(int64_t*)param11 - *(int64_t*)param12 + *(int64_t*)param13 + *(int64_t*)param14 + *(int64_t*)param15 -
        *(int64_t*)param16;
    return (jint)res;
}
