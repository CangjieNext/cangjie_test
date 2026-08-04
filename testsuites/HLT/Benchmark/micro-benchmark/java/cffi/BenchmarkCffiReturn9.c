/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiReturn9.h"

#include <stdint.h>

JNIEXPORT jobject JNICALL Java_BenchmarkCffiReturn9_testFunc(JNIEnv* env, jclass)
{
    jclass data512Class = (*env)->FindClass(env, "Data512");
    jmethodID initID = (*env)->GetMethodID(env, data512Class, "<init>", "()V");
    jobject data512Obj = (*env)->NewObject(env, data512Class, initID);

    jfieldID a0ID = (*env)->GetFieldID(env, data512Class, "a0", "B");
    jfieldID a1ID = (*env)->GetFieldID(env, data512Class, "a1", "B");
    jfieldID a2ID = (*env)->GetFieldID(env, data512Class, "a2", "S");
    jfieldID a3ID = (*env)->GetFieldID(env, data512Class, "a3", "S");
    jfieldID a4ID = (*env)->GetFieldID(env, data512Class, "a4", "I");
    jfieldID a5ID = (*env)->GetFieldID(env, data512Class, "a5", "I");
    jfieldID a6ID = (*env)->GetFieldID(env, data512Class, "a6", "J");
    jfieldID a7ID = (*env)->GetFieldID(env, data512Class, "a7", "J");
    jfieldID a8ID = (*env)->GetFieldID(env, data512Class, "a8", "B");
    jfieldID a9ID = (*env)->GetFieldID(env, data512Class, "a9", "B");
    jfieldID a10ID = (*env)->GetFieldID(env, data512Class, "a10", "S");
    jfieldID a11ID = (*env)->GetFieldID(env, data512Class, "a11", "S");
    jfieldID a12ID = (*env)->GetFieldID(env, data512Class, "a12", "I");
    jfieldID a13ID = (*env)->GetFieldID(env, data512Class, "a13", "I");
    jfieldID a14ID = (*env)->GetFieldID(env, data512Class, "a14", "J");
    jfieldID a15ID = (*env)->GetFieldID(env, data512Class, "a15", "J");
    jfieldID a16ID = (*env)->GetFieldID(env, data512Class, "a16", "J");
    jfieldID a17ID = (*env)->GetFieldID(env, data512Class, "a17", "J");
    jfieldID a18ID = (*env)->GetFieldID(env, data512Class, "a18", "J");
    jfieldID a19ID = (*env)->GetFieldID(env, data512Class, "a19", "J");
    jfieldID a20ID = (*env)->GetFieldID(env, data512Class, "a20", "J");
    jfieldID a21ID = (*env)->GetFieldID(env, data512Class, "a21", "J");
    jfieldID a22ID = (*env)->GetFieldID(env, data512Class, "a22", "J");
    jfieldID a23ID = (*env)->GetFieldID(env, data512Class, "a23", "J");
    jfieldID a24ID = (*env)->GetFieldID(env, data512Class, "a24", "J");
    jfieldID a25ID = (*env)->GetFieldID(env, data512Class, "a25", "J");
    jfieldID a26ID = (*env)->GetFieldID(env, data512Class, "a26", "J");
    jfieldID a27ID = (*env)->GetFieldID(env, data512Class, "a27", "J");
    jfieldID a28ID = (*env)->GetFieldID(env, data512Class, "a28", "J");
    jfieldID a29ID = (*env)->GetFieldID(env, data512Class, "a29", "J");
    jfieldID a30ID = (*env)->GetFieldID(env, data512Class, "a30", "J");
    jfieldID a31ID = (*env)->GetFieldID(env, data512Class, "a31", "J");
    jfieldID a32ID = (*env)->GetFieldID(env, data512Class, "a32", "J");
    jfieldID a33ID = (*env)->GetFieldID(env, data512Class, "a33", "J");
    jfieldID a34ID = (*env)->GetFieldID(env, data512Class, "a34", "J");
    jfieldID a35ID = (*env)->GetFieldID(env, data512Class, "a35", "J");
    jfieldID a36ID = (*env)->GetFieldID(env, data512Class, "a36", "J");
    jfieldID a37ID = (*env)->GetFieldID(env, data512Class, "a37", "J");
    jfieldID a38ID = (*env)->GetFieldID(env, data512Class, "a38", "J");
    jfieldID a39ID = (*env)->GetFieldID(env, data512Class, "a39", "J");
    jfieldID a40ID = (*env)->GetFieldID(env, data512Class, "a40", "J");
    jfieldID a41ID = (*env)->GetFieldID(env, data512Class, "a41", "J");
    jfieldID a42ID = (*env)->GetFieldID(env, data512Class, "a42", "J");
    jfieldID a43ID = (*env)->GetFieldID(env, data512Class, "a43", "J");
    jfieldID a44ID = (*env)->GetFieldID(env, data512Class, "a44", "J");
    jfieldID a45ID = (*env)->GetFieldID(env, data512Class, "a45", "J");
    jfieldID a46ID = (*env)->GetFieldID(env, data512Class, "a46", "J");
    jfieldID a47ID = (*env)->GetFieldID(env, data512Class, "a47", "J");
    jfieldID a48ID = (*env)->GetFieldID(env, data512Class, "a48", "J");
    jfieldID a49ID = (*env)->GetFieldID(env, data512Class, "a49", "J");
    jfieldID a50ID = (*env)->GetFieldID(env, data512Class, "a50", "J");
    jfieldID a51ID = (*env)->GetFieldID(env, data512Class, "a51", "J");
    jfieldID a52ID = (*env)->GetFieldID(env, data512Class, "a52", "J");
    jfieldID a53ID = (*env)->GetFieldID(env, data512Class, "a53", "J");
    jfieldID a54ID = (*env)->GetFieldID(env, data512Class, "a54", "J");
    jfieldID a55ID = (*env)->GetFieldID(env, data512Class, "a55", "J");
    jfieldID a56ID = (*env)->GetFieldID(env, data512Class, "a56", "J");
    jfieldID a57ID = (*env)->GetFieldID(env, data512Class, "a57", "J");
    jfieldID a58ID = (*env)->GetFieldID(env, data512Class, "a58", "J");
    jfieldID a59ID = (*env)->GetFieldID(env, data512Class, "a59", "J");
    jfieldID a60ID = (*env)->GetFieldID(env, data512Class, "a60", "J");
    jfieldID a61ID = (*env)->GetFieldID(env, data512Class, "a61", "J");
    jfieldID a62ID = (*env)->GetFieldID(env, data512Class, "a62", "J");
    jfieldID a63ID = (*env)->GetFieldID(env, data512Class, "a63", "J");
    jfieldID a64ID = (*env)->GetFieldID(env, data512Class, "a64", "J");
    jfieldID a65ID = (*env)->GetFieldID(env, data512Class, "a65", "J");
    jfieldID a66ID = (*env)->GetFieldID(env, data512Class, "a66", "J");
    jfieldID a67ID = (*env)->GetFieldID(env, data512Class, "a67", "J");
    jfieldID a68ID = (*env)->GetFieldID(env, data512Class, "a68", "J");
    jfieldID a69ID = (*env)->GetFieldID(env, data512Class, "a69", "J");
    jfieldID a70ID = (*env)->GetFieldID(env, data512Class, "a70", "J");
    jfieldID a71ID = (*env)->GetFieldID(env, data512Class, "a71", "J");

    (*env)->SetByteField(env, data512Obj, a0ID, 1);
    (*env)->SetByteField(env, data512Obj, a1ID, 1);
    (*env)->SetShortField(env, data512Obj, a2ID, 1);
    (*env)->SetShortField(env, data512Obj, a3ID, 1);
    (*env)->SetIntField(env, data512Obj, a4ID, 1);
    (*env)->SetIntField(env, data512Obj, a5ID, 1);
    (*env)->SetLongField(env, data512Obj, a6ID, 1);
    (*env)->SetLongField(env, data512Obj, a7ID, 1);
    (*env)->SetByteField(env, data512Obj, a8ID, 1);
    (*env)->SetByteField(env, data512Obj, a9ID, 1);
    (*env)->SetShortField(env, data512Obj, a10ID, 1);
    (*env)->SetShortField(env, data512Obj, a11ID, 1);
    (*env)->SetIntField(env, data512Obj, a12ID, 1);
    (*env)->SetIntField(env, data512Obj, a13ID, 1);
    (*env)->SetLongField(env, data512Obj, a14ID, 1);
    (*env)->SetLongField(env, data512Obj, a15ID, 1);
    (*env)->SetLongField(env, data512Obj, a16ID, 1);
    (*env)->SetLongField(env, data512Obj, a17ID, 1);
    (*env)->SetLongField(env, data512Obj, a18ID, 1);
    (*env)->SetLongField(env, data512Obj, a19ID, 1);
    (*env)->SetLongField(env, data512Obj, a20ID, 1);
    (*env)->SetLongField(env, data512Obj, a21ID, 1);
    (*env)->SetLongField(env, data512Obj, a22ID, 1);
    (*env)->SetLongField(env, data512Obj, a23ID, 1);
    (*env)->SetLongField(env, data512Obj, a24ID, 1);
    (*env)->SetLongField(env, data512Obj, a25ID, 1);
    (*env)->SetLongField(env, data512Obj, a26ID, 1);
    (*env)->SetLongField(env, data512Obj, a27ID, 1);
    (*env)->SetLongField(env, data512Obj, a28ID, 1);
    (*env)->SetLongField(env, data512Obj, a29ID, 1);
    (*env)->SetLongField(env, data512Obj, a30ID, 1);
    (*env)->SetLongField(env, data512Obj, a31ID, 1);
    (*env)->SetLongField(env, data512Obj, a32ID, 1);
    (*env)->SetLongField(env, data512Obj, a33ID, 1);
    (*env)->SetLongField(env, data512Obj, a34ID, 1);
    (*env)->SetLongField(env, data512Obj, a35ID, 1);
    (*env)->SetLongField(env, data512Obj, a36ID, 1);
    (*env)->SetLongField(env, data512Obj, a37ID, 1);
    (*env)->SetLongField(env, data512Obj, a38ID, 1);
    (*env)->SetLongField(env, data512Obj, a39ID, 1);
    (*env)->SetLongField(env, data512Obj, a40ID, 1);
    (*env)->SetLongField(env, data512Obj, a41ID, 1);
    (*env)->SetLongField(env, data512Obj, a42ID, 1);
    (*env)->SetLongField(env, data512Obj, a43ID, 1);
    (*env)->SetLongField(env, data512Obj, a44ID, 1);
    (*env)->SetLongField(env, data512Obj, a45ID, 1);
    (*env)->SetLongField(env, data512Obj, a46ID, 1);
    (*env)->SetLongField(env, data512Obj, a47ID, 1);
    (*env)->SetLongField(env, data512Obj, a48ID, 1);
    (*env)->SetLongField(env, data512Obj, a49ID, 1);
    (*env)->SetLongField(env, data512Obj, a50ID, 1);
    (*env)->SetLongField(env, data512Obj, a51ID, 1);
    (*env)->SetLongField(env, data512Obj, a52ID, 1);
    (*env)->SetLongField(env, data512Obj, a53ID, 1);
    (*env)->SetLongField(env, data512Obj, a54ID, 1);
    (*env)->SetLongField(env, data512Obj, a55ID, 1);
    (*env)->SetLongField(env, data512Obj, a56ID, 1);
    (*env)->SetLongField(env, data512Obj, a57ID, 1);
    (*env)->SetLongField(env, data512Obj, a58ID, 1);
    (*env)->SetLongField(env, data512Obj, a59ID, 1);
    (*env)->SetLongField(env, data512Obj, a60ID, 1);
    (*env)->SetLongField(env, data512Obj, a61ID, 1);
    (*env)->SetLongField(env, data512Obj, a62ID, 1);
    (*env)->SetLongField(env, data512Obj, a63ID, 1);
    (*env)->SetLongField(env, data512Obj, a64ID, 1);
    (*env)->SetLongField(env, data512Obj, a65ID, 1);
    (*env)->SetLongField(env, data512Obj, a66ID, 1);
    (*env)->SetLongField(env, data512Obj, a67ID, 1);
    (*env)->SetLongField(env, data512Obj, a68ID, 1);
    (*env)->SetLongField(env, data512Obj, a69ID, 1);
    (*env)->SetLongField(env, data512Obj, a70ID, 1);
    (*env)->SetLongField(env, data512Obj, a71ID, 1);

    return data512Obj;
}
