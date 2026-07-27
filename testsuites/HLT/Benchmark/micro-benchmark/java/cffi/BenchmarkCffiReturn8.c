/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn8.h"

#include <stdint.h>

JNIEXPORT jobject JNICALL Java_BenchmarkCffiReturn8_testFunc(JNIEnv* env, jclass)
{
    jclass data256Class = (*env)->FindClass(env, "Data256");
    jmethodID initID = (*env)->GetMethodID(env, data256Class, "<init>", "()V");
    jobject data256Obj = (*env)->NewObject(env, data256Class, initID);

    jfieldID a0ID = (*env)->GetFieldID(env, data256Class, "a0", "B");
    jfieldID a1ID = (*env)->GetFieldID(env, data256Class, "a1", "B");
    jfieldID a2ID = (*env)->GetFieldID(env, data256Class, "a2", "S");
    jfieldID a3ID = (*env)->GetFieldID(env, data256Class, "a3", "S");
    jfieldID a4ID = (*env)->GetFieldID(env, data256Class, "a4", "I");
    jfieldID a5ID = (*env)->GetFieldID(env, data256Class, "a5", "I");
    jfieldID a6ID = (*env)->GetFieldID(env, data256Class, "a6", "J");
    jfieldID a7ID = (*env)->GetFieldID(env, data256Class, "a7", "J");
    jfieldID a8ID = (*env)->GetFieldID(env, data256Class, "a8", "B");
    jfieldID a9ID = (*env)->GetFieldID(env, data256Class, "a9", "B");
    jfieldID a10ID = (*env)->GetFieldID(env, data256Class, "a10", "S");
    jfieldID a11ID = (*env)->GetFieldID(env, data256Class, "a11", "S");
    jfieldID a12ID = (*env)->GetFieldID(env, data256Class, "a12", "I");
    jfieldID a13ID = (*env)->GetFieldID(env, data256Class, "a13", "I");
    jfieldID a14ID = (*env)->GetFieldID(env, data256Class, "a14", "J");
    jfieldID a15ID = (*env)->GetFieldID(env, data256Class, "a15", "J");
    jfieldID a16ID = (*env)->GetFieldID(env, data256Class, "a16", "J");
    jfieldID a17ID = (*env)->GetFieldID(env, data256Class, "a17", "J");
    jfieldID a18ID = (*env)->GetFieldID(env, data256Class, "a18", "J");
    jfieldID a19ID = (*env)->GetFieldID(env, data256Class, "a19", "J");
    jfieldID a20ID = (*env)->GetFieldID(env, data256Class, "a20", "J");
    jfieldID a21ID = (*env)->GetFieldID(env, data256Class, "a21", "J");
    jfieldID a22ID = (*env)->GetFieldID(env, data256Class, "a22", "J");
    jfieldID a23ID = (*env)->GetFieldID(env, data256Class, "a23", "J");
    jfieldID a24ID = (*env)->GetFieldID(env, data256Class, "a24", "J");
    jfieldID a25ID = (*env)->GetFieldID(env, data256Class, "a25", "J");
    jfieldID a26ID = (*env)->GetFieldID(env, data256Class, "a26", "J");
    jfieldID a27ID = (*env)->GetFieldID(env, data256Class, "a27", "J");
    jfieldID a28ID = (*env)->GetFieldID(env, data256Class, "a28", "J");
    jfieldID a29ID = (*env)->GetFieldID(env, data256Class, "a29", "J");
    jfieldID a30ID = (*env)->GetFieldID(env, data256Class, "a30", "J");
    jfieldID a31ID = (*env)->GetFieldID(env, data256Class, "a31", "J");
    jfieldID a32ID = (*env)->GetFieldID(env, data256Class, "a32", "J");
    jfieldID a33ID = (*env)->GetFieldID(env, data256Class, "a33", "J");
    jfieldID a34ID = (*env)->GetFieldID(env, data256Class, "a34", "J");
    jfieldID a35ID = (*env)->GetFieldID(env, data256Class, "a35", "J");
    jfieldID a36ID = (*env)->GetFieldID(env, data256Class, "a36", "J");
    jfieldID a37ID = (*env)->GetFieldID(env, data256Class, "a37", "J");
    jfieldID a38ID = (*env)->GetFieldID(env, data256Class, "a38", "J");
    jfieldID a39ID = (*env)->GetFieldID(env, data256Class, "a39", "J");

    (*env)->SetByteField(env, data256Obj, a0ID, 1);
    (*env)->SetByteField(env, data256Obj, a1ID, 1);
    (*env)->SetShortField(env, data256Obj, a2ID, 1);
    (*env)->SetShortField(env, data256Obj, a3ID, 1);
    (*env)->SetIntField(env, data256Obj, a4ID, 1);
    (*env)->SetIntField(env, data256Obj, a5ID, 1);
    (*env)->SetLongField(env, data256Obj, a6ID, 1);
    (*env)->SetLongField(env, data256Obj, a7ID, 1);
    (*env)->SetByteField(env, data256Obj, a8ID, 1);
    (*env)->SetByteField(env, data256Obj, a9ID, 1);
    (*env)->SetShortField(env, data256Obj, a10ID, 1);
    (*env)->SetShortField(env, data256Obj, a11ID, 1);
    (*env)->SetIntField(env, data256Obj, a12ID, 1);
    (*env)->SetIntField(env, data256Obj, a13ID, 1);
    (*env)->SetLongField(env, data256Obj, a14ID, 1);
    (*env)->SetLongField(env, data256Obj, a15ID, 1);
    (*env)->SetLongField(env, data256Obj, a16ID, 1);
    (*env)->SetLongField(env, data256Obj, a17ID, 1);
    (*env)->SetLongField(env, data256Obj, a18ID, 1);
    (*env)->SetLongField(env, data256Obj, a19ID, 1);
    (*env)->SetLongField(env, data256Obj, a20ID, 1);
    (*env)->SetLongField(env, data256Obj, a21ID, 1);
    (*env)->SetLongField(env, data256Obj, a22ID, 1);
    (*env)->SetLongField(env, data256Obj, a23ID, 1);
    (*env)->SetLongField(env, data256Obj, a24ID, 1);
    (*env)->SetLongField(env, data256Obj, a25ID, 1);
    (*env)->SetLongField(env, data256Obj, a26ID, 1);
    (*env)->SetLongField(env, data256Obj, a27ID, 1);
    (*env)->SetLongField(env, data256Obj, a28ID, 1);
    (*env)->SetLongField(env, data256Obj, a29ID, 1);
    (*env)->SetLongField(env, data256Obj, a30ID, 1);
    (*env)->SetLongField(env, data256Obj, a31ID, 1);
    (*env)->SetLongField(env, data256Obj, a32ID, 1);
    (*env)->SetLongField(env, data256Obj, a33ID, 1);
    (*env)->SetLongField(env, data256Obj, a34ID, 1);
    (*env)->SetLongField(env, data256Obj, a35ID, 1);
    (*env)->SetLongField(env, data256Obj, a36ID, 1);
    (*env)->SetLongField(env, data256Obj, a37ID, 1);
    (*env)->SetLongField(env, data256Obj, a38ID, 1);
    (*env)->SetLongField(env, data256Obj, a39ID, 1);

    return data256Obj;
}
