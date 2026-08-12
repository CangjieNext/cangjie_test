/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn3.h"

#include <stdint.h>

JNIEXPORT jshort JNICALL Java_BenchmarkCffiReturn3_testFunc(JNIEnv*, jclass)
{
    int16_t res = 1;
    return (jshort)res;
}
