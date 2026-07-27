/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiCpointer3.h"

#include <malloc.h>
#include <stdint.h>

JNIEXPORT jlong JNICALL Java_BenchmarkCffiCpointer3_getPtr(JNIEnv*, jclass, jbyte num)
{
    int8_t* ptr = (int8_t*)malloc(sizeof(int8_t));
    ptr[0] = num;
    return (jlong)ptr;
}

JNIEXPORT jint JNICALL Java_BenchmarkCffiCpointer3_testFunc(
    JNIEnv*, jclass, jlong param1, jlong param2, jlong param3, jlong param4)
{
    int32_t res = *(int8_t*)param1 + *(int8_t*)param2 + *(int8_t*)param3 - *(int8_t*)param4;
    return (jint)res;
}
