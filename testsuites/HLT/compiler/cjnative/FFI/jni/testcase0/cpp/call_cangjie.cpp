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
#include <windows.h>

// 声明函数指针类型
typedef int (*InitCJRuntimeFunc)(struct RuntimeParam*);
typedef int (*LoadCJLibraryFunc)(const char*);
typedef void* (*FindCJSymbolFunc)(const char*, const char*);

static jobject g_callback = nullptr;
static JavaVM* g_vm = nullptr; 
static jmethodID g_onEvent = nullptr;

// 全局函数指针
static InitCJRuntimeFunc g_InitCJRuntime = nullptr;
static LoadCJLibraryFunc g_LoadCJLibraryWithInit = nullptr;
static FindCJSymbolFunc g_FindCJSymbol = nullptr;

// 将triggerCallback函数声明为C风格和导出符号
#ifdef _WIN32
#define EXPORT_API extern "C" __declspec(dllexport)
#else
#define EXPORT_API extern "C"
#endif

// DLL句柄
static HMODULE g_cangjieDll = nullptr;

std::string getCurrentDirectory() {
    char buffer[MAX_PATH];
    GetCurrentDirectoryA(MAX_PATH, buffer);
    return std::string(buffer);
}

bool loadCangjieFunctions() {
    // 加载DLL
    g_cangjieDll = LoadLibraryA("libcangjie-runtime.dll");
    if (!g_cangjieDll) {
        std::cout << "Failed to load cangjie-runtime.dll, error: " << GetLastError() << std::endl;
        return false;
    }
    std::cout << "1111: " << std::endl;
    
    // 获取函数地址
    g_InitCJRuntime = (InitCJRuntimeFunc)GetProcAddress(g_cangjieDll, "InitCJRuntime");
    g_LoadCJLibraryWithInit = (LoadCJLibraryFunc)GetProcAddress(g_cangjieDll, "LoadCJLibraryWithInit");
    g_FindCJSymbol = (FindCJSymbolFunc)GetProcAddress(g_cangjieDll, "FindCJSymbol");
    std::cout << "2222: " << std::endl;
    
    if (!g_InitCJRuntime || !g_LoadCJLibraryWithInit || !g_FindCJSymbol) {
        std::cout << "Failed to get function pointers from cangjie-runtime.dll" << std::endl;
        FreeLibrary(g_cangjieDll);
        return false;
    }
    
    std::cout << "Successfully loaded cangjie-runtime.dll functions" << std::endl;
    return true;
}

void init_and_load() {
    static bool init = false;
    if (init) {
        return;
    }
    // 先加载DLL函数
    if (!loadCangjieFunctions()) {
        std::cout << "Failed to load Cangjie functions" << std::endl;
        return;
    }
    struct RuntimeParam param = {};
    if (g_InitCJRuntime(&param) != E_OK) {
        std::cout << "failed to init." << std::endl;
    }
    auto tmp = getCurrentDirectory() + "\\build\\lib\\libjavacallcj.dll";
    // if (g_LoadCJLibraryWithInit("libjavacallcj.dll") != E_OK) {
    if (g_LoadCJLibraryWithInit(tmp.c_str()) != E_OK) {
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
JNIEXPORT void JNICALL Java_Main_nativeEntry(JNIEnv *env, jclass clazz, jobject cb)
{
    g_callback = env->NewGlobalRef(cb);
    jclass cls = env->GetObjectClass(cb);
    g_onEvent = env->GetMethodID(cls, "onEvent", "(ILjava/lang/String;)V");

    // 使用动态加载的函数
    if (!g_FindCJSymbol) {
        std::cout << "FindCJSymbol function not loaded" << std::endl;
        return;
    }

    void * funcInCj = g_FindCJSymbol("libjavacallcj.dll", "cjOnEvent");
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


EXPORT_API void triggerCallbackWithNewNativeThread(int32_t code, const char* msg)
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

EXPORT_API void triggerCallback(int32_t code, const char* msg) {
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
            // env->ExceptionClear();
            env->DeleteLocalRef(jmsg);
            return;
        }
        std::cout << "triggerCallback called.*************************" << std::endl;
    }
    env->DeleteLocalRef(jmsg);
    g_vm->DetachCurrentThread();
}

EXPORT_API void printJavaHello()
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

// 添加清理函数
JNIEXPORT void JNICALL Java_Main_nativeCleanup(JNIEnv *env, jclass) {
    if (g_cangjieDll) {
        FreeLibrary(g_cangjieDll);
        g_cangjieDll = nullptr;
    }
    if (g_callback) {
        env->DeleteGlobalRef(g_callback);
        g_callback = nullptr;
    }
    std::cout << "cleaning done." << std::endl;
}

#ifdef __cplusplus
}
#endif
