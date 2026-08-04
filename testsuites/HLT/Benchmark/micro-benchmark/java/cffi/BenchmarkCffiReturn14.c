/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn13.h"

JNIEXPORT jlong JNICALL Java_BenchmarkCffiReturn14_testFunc(JNIEnv*, jclass)
{
    char* res = "123456";
    return (jlong)res;
}
