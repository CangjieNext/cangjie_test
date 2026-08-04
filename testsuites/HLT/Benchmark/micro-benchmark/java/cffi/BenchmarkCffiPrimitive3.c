/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiPrimitive3.h"

#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiPrimitive3_testFunc(JNIEnv*, jclass, jlong param1, jlong param2, jlong param3,
    jlong param4, jlong param5, jlong param6, jlong param7, jlong param8)
{
    int32_t res = param1 + param2 + param3 + param4 - param5 - param6 - param7 - param8;
    return (jint)res;
}
