/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn11.h"

#include <malloc.h>
#include <stdint.h>

JNIEXPORT jlong JNICALL Java_BenchmarkCffiReturn11_testFunc(JNIEnv*, jclass)
{
    int64_t* ptr = (int64_t*)malloc(sizeof(int64_t));
    ptr[0] = 1;
    return (jlong)ptr;
}
