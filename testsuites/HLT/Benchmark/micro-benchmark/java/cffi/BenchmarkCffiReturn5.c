/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn5.h"

#include <stdint.h>

JNIEXPORT jobject JNICALL Java_BenchmarkCffiReturn5_testFunc(JNIEnv* env, jclass)
{
    jclass data24Class = (*env)->FindClass(env, "Data24");
    jmethodID initID = (*env)->GetMethodID(env, data24Class, "<init>", "()V");
    jobject data24Obj = (*env)->NewObject(env, data24Class, initID);

    jfieldID a0ID = (*env)->GetFieldID(env, data24Class, "a0", "B");
    jfieldID a1ID = (*env)->GetFieldID(env, data24Class, "a1", "B");
    jfieldID a2ID = (*env)->GetFieldID(env, data24Class, "a2", "S");
    jfieldID a3ID = (*env)->GetFieldID(env, data24Class, "a3", "S");
    jfieldID a4ID = (*env)->GetFieldID(env, data24Class, "a4", "I");
    jfieldID a5ID = (*env)->GetFieldID(env, data24Class, "a5", "I");
    jfieldID a6ID = (*env)->GetFieldID(env, data24Class, "a6", "I");

    (*env)->SetByteField(env, data24Obj, a0ID, 1);
    (*env)->SetByteField(env, data24Obj, a1ID, 2);
    (*env)->SetShortField(env, data24Obj, a2ID, 3);
    (*env)->SetShortField(env, data24Obj, a3ID, 4);
    (*env)->SetIntField(env, data24Obj, a4ID, 5);
    (*env)->SetIntField(env, data24Obj, a5ID, 6);
    (*env)->SetIntField(env, data24Obj, a6ID, 7);

    return data24Obj;
}
