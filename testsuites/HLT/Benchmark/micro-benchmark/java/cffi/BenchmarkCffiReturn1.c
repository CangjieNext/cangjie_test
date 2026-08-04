/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn1.h"

#include <stdint.h>

JNIEXPORT jlong JNICALL Java_BenchmarkCffiReturn1_testFunc(JNIEnv*, jclass)
{
    int64_t res = 1;
    return (jlong)res;
}
