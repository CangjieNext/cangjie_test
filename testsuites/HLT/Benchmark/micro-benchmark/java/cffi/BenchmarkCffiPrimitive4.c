/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiPrimitive4.h"

#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiPrimitive4_testFunc(JNIEnv*, jclass, jlong param1, jlong param2, jlong param3,
    jlong param4, jlong param5, jlong param6, jlong param7, jlong param8, jlong param9, jlong param10, jlong param11,
    jlong param12, jlong param13, jlong param14, jlong param15, jlong param16)
{
    int32_t res = param1 + param2 + param3 + param4 - param5 - param6 - param7 - param8 + param9 + param10 + param11 +
        param12 - param13 - param14 - param15 - param16;
    return (jint)res;
}
