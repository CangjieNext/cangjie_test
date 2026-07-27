/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiPrimitive6.h"

#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiPrimitive6_testFunc(
    JNIEnv*, jclass, jshort param1, jshort param2, jshort param3, jshort param4)
{
    int32_t res = param1 + param2 - param3 - param4;
    return (jint)res;
}
