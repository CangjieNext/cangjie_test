/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "Main.h"

#include <iostream>
#include <future>
#include "Cangjie.h"
#include <thread>

static jobject g_callback = nullptr;
static JavaVM* g_vm = nullptr; 
static jmethodID g_onEvent = nullptr;

void init_and_load() {
    static bool init = false;
    if (init) {
        return;
    }
    struct RuntimeParam param = {};
    if (InitCJRuntime(&param) != E_OK) {
        std::cout << "failed to init." << std::endl;
    }
    if (LoadCJLibraryWithInit("libjavacallcj.so") != E_OK) {
       std::cout << "failed to load." << std::endl;
    }
    init = true;
}

extern "C" JNIEXPORT jint JNICALL 
JNI_OnLoad(JavaVM *env, void *reserved) {
    init_and_load();
    std::cout << "init_and_load completed." << std::endl;
    g_vm = env;
    return JNI_VERSION_1_6;
}

#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL Java_Main_nativeEntry(JNIEnv *env, jclass, jobject cb)
{
    g_callback = env->NewGlobalRef(cb);
    jclass cls = env->GetObjectClass(cb);
    g_onEvent = env->GetMethodID(cls, "onEvent", "(ILjava/lang/String;)V");

    void * funcInCj = FindCJSymbol("libjavacallcj.so", "cjOnEvent");
    if (funcInCj == nullptr) {
        std::cout << "failed to find." << std::endl;
    }
    std::cout << "funcInCj called." << std::endl;
    ((void(*)()) funcInCj)();
}

JNIEnv* GetJniEnv()
{
    jint version_ { JNI_VERSION_1_6 };
    JNIEnv* jniEnv = nullptr;
    jint retVal = g_vm->GetEnv(reinterpret_cast<void**>(&jniEnv), version_);
    if (retVal == JNI_OK) {
        return jniEnv;
    } else {
        jint attachRet = g_vm->AttachCurrentThread(reinterpret_cast<void**>(&jniEnv), nullptr);
        if (attachRet != JNI_OK) {
            std::cout << "GetJniEnv: Failed to get JNI environment." << std::endl;
            return nullptr;
        }
    }
    return jniEnv;
}

void triggerCallbackWithNewNativeThread(int32_t code, const char* msg)
{
    std::promise<void> prom;
    std::future<void> fut = prom.get_future();
    std::thread([code, msg, &prom] {
        JNIEnv* env = GetJniEnv();
        jstring jmsg = env->NewStringUTF(msg);
        if (env && g_callback && g_onEvent) {
            std::cout << "triggerCallbackWithNewNativeThread start!**************************" << std::endl;
            env->CallVoidMethod(g_callback, g_onEvent, code, jmsg);
            if (env->ExceptionCheck()) {
                std::cerr << "Java exception occurred during CallVoidMethod!" << std::endl;
                env->ExceptionDescribe();
                env->ExceptionClear();
            }
            std::cout << "triggerCallbackWithNewNativeThread called.*************************" << std::endl;
        }
        env->DeleteLocalRef(jmsg);
        g_vm->DetachCurrentThread();
        prom.set_value();
    }).detach();

    fut.get();
}

void triggerCallback(int32_t code, const char* msg) {
    JNIEnv* env = GetJniEnv();
    if (env == nullptr) {
        std::cout << "jni env is null!" << std::endl;
        return;
    }
    jstring jmsg = env->NewStringUTF(msg);
    if (g_callback && g_onEvent) {
        std::cout << "triggerCallback start!**************************" << std::endl;
        env->CallVoidMethod(g_callback, g_onEvent, code, jmsg);
        if (env->ExceptionCheck()) {
            std::cerr << "Java exception occurred during CallVoidMethod!" << std::endl;
            env->ExceptionDescribe();
            env->ExceptionClear();
            env->DeleteLocalRef(jmsg);
            return;
        }
        std::cout << "triggerCallback called.*************************" << std::endl;
    }
    env->DeleteLocalRef(jmsg);
    g_vm->DetachCurrentThread();
}

void printJavaHello()
{
    JNIEnv* env = GetJniEnv();
    if (env == nullptr) {
        std::cout << "jni env is null!" << std::endl;
        return;
    }
    jclass cls = env->FindClass("Hello");
    jmethodID constructor = env->GetMethodID(cls, "<init>", "()V");
    jobject obj = env->NewObject(cls, constructor);
    jmethodID printHello = env->GetMethodID(cls, "printHello", "()V");
    env->CallVoidMethod(obj, printHello);
    g_vm->DetachCurrentThread();
}
#ifdef __cplusplus
}
#endif
