/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiPrimitive2.h"

#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiPrimitive2_testFunc(JNIEnv*, jclass, jlong param1)
{
    int32_t res = param1 % 2;
    return (jint)res;
}
