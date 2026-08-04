/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiFibonacci2.h"

#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiFibonacci2_Fibonacci2(JNIEnv* env, jclass, jint n, jintArray fib)
{
    int32_t i;
    jint* ptr = (*env)->GetIntArrayElements(env, fib, NULL);
    ptr[0] = 0;
    ptr[1] = 1;

    for (i = 2; i < n; i++) {
        ptr[i] = ptr[i - 1] + ptr[i - 2];
    }
    return ptr[n - 1];
}
