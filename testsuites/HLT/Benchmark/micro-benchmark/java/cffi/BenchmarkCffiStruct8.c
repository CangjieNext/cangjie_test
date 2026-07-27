/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiStruct8.h"

#include <stdint.h>

JNIEXPORT jint JNICALL Java_BenchmarkCffiStruct8_testFunc(JNIEnv* env, jclass, jobject param1, jobject param2,
    jobject param3, jobject param4, jobject param5, jobject param6, jobject param7, jobject param8, jobject param9,
    jobject param10, jobject param11, jobject param12, jobject param13, jobject param14, jobject param15,
    jobject param16)
{
    jclass data64Class = (*env)->GetObjectClass(env, param1);

    jfieldID a0ID = (*env)->GetFieldID(env, data64Class, "a0", "B");
    jfieldID a2ID = (*env)->GetFieldID(env, data64Class, "a2", "S");
    jfieldID a4ID = (*env)->GetFieldID(env, data64Class, "a4", "I");
    jfieldID a8ID = (*env)->GetFieldID(env, data64Class, "a8", "B");

    jbyte a0_1 = (*env)->GetByteField(env, param1, a0ID);
    jshort a2_1 = (*env)->GetShortField(env, param2, a2ID);
    jint a4_1 = (*env)->GetIntField(env, param3, a4ID);
    jbyte a8_1 = (*env)->GetByteField(env, param4, a8ID);

    jbyte a0_2 = (*env)->GetByteField(env, param5, a0ID);
    jshort a2_2 = (*env)->GetShortField(env, param6, a2ID);
    jint a4_2 = (*env)->GetIntField(env, param7, a4ID);
    jbyte a8_2 = (*env)->GetByteField(env, param8, a8ID);

    jbyte a0_3 = (*env)->GetByteField(env, param9, a0ID);
    jshort a2_3 = (*env)->GetShortField(env, param10, a2ID);
    jint a4_3 = (*env)->GetIntField(env, param11, a4ID);
    jbyte a8_3 = (*env)->GetByteField(env, param12, a8ID);

    jbyte a0_4 = (*env)->GetByteField(env, param13, a0ID);
    jshort a2_4 = (*env)->GetShortField(env, param14, a2ID);
    jint a4_4 = (*env)->GetIntField(env, param15, a4ID);
    jbyte a8_4 = (*env)->GetByteField(env, param16, a8ID);

    int32_t res =
        a0_1 + a2_1 + a4_1 + a8_1 + a0_2 + a2_2 + a4_2 + a8_2 - a0_3 - a2_3 - a4_3 - a8_3 - a0_4 - a2_4 - a4_4 - a8_4;
    return (jint)res;
}
