/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn7.h"

#include <stdint.h>

JNIEXPORT jobject JNICALL Java_BenchmarkCffiReturn7_testFunc(JNIEnv* env, jclass)
{
    jclass data64Class = (*env)->FindClass(env, "Data64");
    jmethodID initID = (*env)->GetMethodID(env, data64Class, "<init>", "()V");
    jobject data64Obj = (*env)->NewObject(env, data64Class, initID);

    jfieldID a0ID = (*env)->GetFieldID(env, data64Class, "a0", "B");
    jfieldID a1ID = (*env)->GetFieldID(env, data64Class, "a1", "B");
    jfieldID a2ID = (*env)->GetFieldID(env, data64Class, "a2", "S");
    jfieldID a3ID = (*env)->GetFieldID(env, data64Class, "a3", "S");
    jfieldID a4ID = (*env)->GetFieldID(env, data64Class, "a4", "I");
    jfieldID a5ID = (*env)->GetFieldID(env, data64Class, "a5", "I");
    jfieldID a6ID = (*env)->GetFieldID(env, data64Class, "a6", "J");
    jfieldID a7ID = (*env)->GetFieldID(env, data64Class, "a7", "J");
    jfieldID a8ID = (*env)->GetFieldID(env, data64Class, "a8", "B");
    jfieldID a9ID = (*env)->GetFieldID(env, data64Class, "a9", "B");
    jfieldID a10ID = (*env)->GetFieldID(env, data64Class, "a10", "S");
    jfieldID a11ID = (*env)->GetFieldID(env, data64Class, "a11", "S");
    jfieldID a12ID = (*env)->GetFieldID(env, data64Class, "a12", "I");
    jfieldID a13ID = (*env)->GetFieldID(env, data64Class, "a13", "I");
    jfieldID a14ID = (*env)->GetFieldID(env, data64Class, "a14", "J");
    jfieldID a15ID = (*env)->GetFieldID(env, data64Class, "a15", "J");

    (*env)->SetByteField(env, data64Obj, a0ID, 1);
    (*env)->SetByteField(env, data64Obj, a1ID, 1);
    (*env)->SetShortField(env, data64Obj, a2ID, 1);
    (*env)->SetShortField(env, data64Obj, a3ID, 1);
    (*env)->SetIntField(env, data64Obj, a4ID, 1);
    (*env)->SetIntField(env, data64Obj, a5ID, 1);
    (*env)->SetLongField(env, data64Obj, a6ID, 1);
    (*env)->SetLongField(env, data64Obj, a7ID, 1);
    (*env)->SetByteField(env, data64Obj, a8ID, 1);
    (*env)->SetByteField(env, data64Obj, a9ID, 1);
    (*env)->SetShortField(env, data64Obj, a10ID, 1);
    (*env)->SetShortField(env, data64Obj, a11ID, 1);
    (*env)->SetIntField(env, data64Obj, a12ID, 1);
    (*env)->SetIntField(env, data64Obj, a13ID, 1);
    (*env)->SetLongField(env, data64Obj, a14ID, 1);
    (*env)->SetLongField(env, data64Obj, a15ID, 1);

    return data64Obj;
}
