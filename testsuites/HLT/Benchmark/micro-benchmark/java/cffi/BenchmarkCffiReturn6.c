/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn6.h"

#include <stdint.h>

JNIEXPORT jobject JNICALL Java_BenchmarkCffiReturn6_testFunc(JNIEnv* env, jclass)
{
    jclass data32Class = (*env)->FindClass(env, "Data32");
    jmethodID initID = (*env)->GetMethodID(env, data32Class, "<init>", "()V");
    jobject data32Obj = (*env)->NewObject(env, data32Class, initID);

    jfieldID a0ID = (*env)->GetFieldID(env, data32Class, "a0", "B");
    jfieldID a1ID = (*env)->GetFieldID(env, data32Class, "a1", "B");
    jfieldID a2ID = (*env)->GetFieldID(env, data32Class, "a2", "S");
    jfieldID a3ID = (*env)->GetFieldID(env, data32Class, "a3", "S");
    jfieldID a4ID = (*env)->GetFieldID(env, data32Class, "a4", "I");
    jfieldID a5ID = (*env)->GetFieldID(env, data32Class, "a5", "I");
    jfieldID a6ID = (*env)->GetFieldID(env, data32Class, "a6", "J");
    jfieldID a7ID = (*env)->GetFieldID(env, data32Class, "a7", "J");

    (*env)->SetByteField(env, data32Obj, a0ID, 1);
    (*env)->SetByteField(env, data32Obj, a1ID, 2);
    (*env)->SetShortField(env, data32Obj, a2ID, 3);
    (*env)->SetShortField(env, data32Obj, a3ID, 4);
    (*env)->SetIntField(env, data32Obj, a4ID, 5);
    (*env)->SetIntField(env, data32Obj, a5ID, 6);
    (*env)->SetLongField(env, data32Obj, a6ID, 7);
    (*env)->SetLongField(env, data32Obj, a7ID, 8);

    return data32Obj;
}
