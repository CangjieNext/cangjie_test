/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiStruct6.h"

#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiStruct6_testFunc(
    JNIEnv* env, jclass, jobject param1)
{
    jclass data64Class = (*env)->GetObjectClass(env, param1);

    jfieldID a0ID = (*env)->GetFieldID(env, data64Class, "a0", "B");
    jfieldID a2ID = (*env)->GetFieldID(env, data64Class, "a2", "S");
    jfieldID a4ID = (*env)->GetFieldID(env, data64Class, "a4", "I");
    jfieldID a8ID = (*env)->GetFieldID(env, data64Class, "a8", "B");

    jbyte a0 = (*env)->GetByteField(env, param1, a0ID);
    jshort a2 = (*env)->GetShortField(env, param1, a2ID);
    jint a4 = (*env)->GetIntField(env, param1, a4ID);
    jbyte a8 = (*env)->GetByteField(env, param1, a8ID);

    int32_t res = a0 + a2 + a4 + a8;
    return (jint)res;
}
