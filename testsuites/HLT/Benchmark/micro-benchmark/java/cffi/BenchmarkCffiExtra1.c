/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiExtra1.h"

#include <stdint.h>
#include <stdio.h>

typedef struct {
    int8_t b0[16];
    uint32_t b1;
    uint32_t b2;
    int8_t b3[6];
    uint8_t b4;
    uint8_t b5;
    int16_t b6;
    uint16_t b7;
    uint8_t b8;
    uint8_t b9;
} StructB;

typedef struct {
    int8_t a0[6];
    int8_t a1[6];
    uint8_t a2;
    uint8_t a3;
    uint8_t a4;
    uint8_t a5;
    uint32_t a6;
    StructB a7;
} StructA;

JNIEXPORT jint JNICALL Java_BenchmarkCffiExtra1_testFunc(JNIEnv* env, jclass, jobject param1)
{
    jclass structAClass = (*env)->GetObjectClass(env, param1);

    jfieldID a0ID = (*env)->GetFieldID(env, structAClass, "a0", "[B");
    jfieldID a1ID = (*env)->GetFieldID(env, structAClass, "a1", "[B");
    jfieldID a6ID = (*env)->GetFieldID(env, structAClass, "a6", "I");
    jfieldID a7ID = (*env)->GetFieldID(env, structAClass, "a7", "LStructB;");

    jbyteArray a0Obj = (*env)->GetObjectField(env, param1, a0ID);
    jbyteArray a1Obj = (*env)->GetObjectField(env, param1, a1ID);

    jbyte* a0 = (*env)->GetByteArrayElements(env, a0Obj, NULL);
    jbyte* a1 = (*env)->GetByteArrayElements(env, a1Obj, NULL);
    jint a6 = (*env)->GetIntField(env, param1, a6ID);
    jobject a7 = (*env)->GetObjectField(env, param1, a7ID);

    jclass structBClass = (*env)->GetObjectClass(env, a7);

    jfieldID b0ID = (*env)->GetFieldID(env, structBClass, "b0", "[B");
    jfieldID b3ID = (*env)->GetFieldID(env, structBClass, "b3", "[B");
    jfieldID b5ID = (*env)->GetFieldID(env, structBClass, "b5", "B");

    jbyteArray b0Obj = (*env)->GetObjectField(env, a7, b0ID);
    jbyteArray b3Obj = (*env)->GetObjectField(env, a7, b3ID);

    jbyte* b0 = (*env)->GetByteArrayElements(env, b0Obj, NULL);
    jbyte* b3 = (*env)->GetByteArrayElements(env, b3Obj, NULL);
    jbyte b5 = (*env)->GetByteField(env, a7, b5ID);

    return (jint)(a0[3] + a1[5] + a6 + b0[11] + b3[2] + b5);
}
