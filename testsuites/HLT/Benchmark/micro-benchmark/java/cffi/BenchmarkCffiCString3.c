/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "BenchmarkCffiCString3.h"

#include <malloc.h>
#include <stdint.h>
#include <string.h>

JNIEXPORT jlong JNICALL Java_BenchmarkCffiCString3_mallocCString(JNIEnv* env, jclass, jstring jstr)
{
    const char* utf8Str = (*env)->GetStringUTFChars(env, jstr, NULL);
    if (utf8Str != NULL) {
        size_t length = strlen(utf8Str);
        char* copied = (char*)malloc(length + 1);
        if (copied != NULL) {
            strcpy(copied, utf8Str);
        }
        (*env)->ReleaseStringUTFChars(env, jstr, utf8Str);
        return (jlong)copied;
    }
    return (jlong)utf8Str;
}

JNIEXPORT jint JNICALL Java_BenchmarkCffiCString3_testFunc(JNIEnv*, jclass, jlong param1, jlong param2, jlong param3,
    jlong param4, jlong param5, jlong param6, jlong param7, jlong param8)
{
    return 0;
}
