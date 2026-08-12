/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiFibonacci3.h"

#include <malloc.h>
#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiFibonacci3_Fibonacci3(JNIEnv* env, jclass, jint n, jintArray fib, jlong res)
{
    int32_t i;
    jint* ptr = (*env)->GetIntArrayElements(env, fib, NULL);
    ptr[0] = 0;
    ptr[1] = 1;

    for (i = 2; i < n; i++) {
        ptr[i] = ptr[i - 1] + ptr[i - 2];
    }
    *(jint*)res = ptr[n - 1];
    return 0;
}

JNIEXPORT jlong JNICALL Java_BenchmarkCffiFibonacci3_GetPtr(JNIEnv*, jclass, jint n)
{
    int32_t* ptr = (int32_t*)malloc(sizeof(int32_t));
    *ptr = n;
    return ptr;
}
