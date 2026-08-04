/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiExtra2.h"

#include <malloc.h>
#include <stdint.h>

typedef struct data_13 {
    uint32_t a0;
    uint32_t a1;
    uint32_t a2;
    uint8_t a3;
} StructData;

JNIEXPORT jlong JNICALL Java_BenchmarkCffiExtra2_getPtr(JNIEnv*, jclass, jbyte num1, jshort num2, jint num3, jlong num4)
{
    StructData* ptr = (StructData*)malloc(sizeof(StructData));
    ptr->a0 = num1;
    ptr->a1 = num2;
    ptr->a2 = num3;
    ptr->a3 = num4;
    return (jlong)ptr;
}

JNIEXPORT jint JNICALL Java_BenchmarkCffiExtra2_testFunc(JNIEnv*, jclass, jlong data, jint size)
{
    int32_t res =
        ((StructData*)data)->a0 + ((StructData*)data)->a1 + ((StructData*)data)->a2 + ((StructData*)data)->a3 + size;
    return (jint)res;
}
