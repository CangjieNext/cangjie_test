/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiCpointer2.h"

#include <malloc.h>
#include <stdint.h>

typedef struct {
    int8_t a0;
    int16_t a1;
    int32_t a2;
    int64_t a3;
} Data15;

JNIEXPORT jobject JNICALL Java_BenchmarkCffiCpointer2_getPtr(
    JNIEnv* env, jclass, jbyte num1, jshort num2, jint num3, jlong num4)
{
    Data15* ptr = (Data15*)malloc(sizeof(Data15));
    ptr->a0 = num1;
    ptr->a1 = num2;
    ptr->a2 = num3;
    ptr->a3 = num4;

    jobject buffer = (*env)->NewDirectByteBuffer(env, ptr, sizeof(Data15));
    return buffer;
}

JNIEXPORT jint JNICALL Java_BenchmarkCffiCpointer2_testFunc(
    JNIEnv* env, jclass, jobject param1, jobject param2, jobject param3, jobject param4)
{
    Data15* ptr1 = (Data15*)(*env)->GetDirectBufferAddress(env, param1);
    Data15* ptr2 = (Data15*)(*env)->GetDirectBufferAddress(env, param2);
    Data15* ptr3 = (Data15*)(*env)->GetDirectBufferAddress(env, param3);
    Data15* ptr4 = (Data15*)(*env)->GetDirectBufferAddress(env, param4);
    int32_t res = ptr1->a0 + ptr2->a1 + ptr3->a2 - ptr4->a3;
    return res;
}
