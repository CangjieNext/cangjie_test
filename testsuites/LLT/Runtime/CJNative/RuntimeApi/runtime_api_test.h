/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#ifndef RUNTIME_API_TEST_H
#define RUNTIME_API_TEST_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef void* CJThreadHandle;
typedef void* SemiCJThreadHandle;
typedef void* (*CJTaskFunc)(void*);
typedef unsigned int CJThreadKey;
typedef void (*DestructorFunc)(void*);

struct CJThreadSpecificData {
    CJThreadKey key;
    void* value;
};

enum RTErrorCode { E_OK = 0, E_ARGS = -1, E_TIMEOUT = -2, E_STATE = -3, E_FAILED = -4 };

enum RTLogLevel {
    RTLOG_VERBOSE,
    RTLOG_DEBUG,
    RTLOG_INFO,
    RTLOG_REPORT,
    RTLOG_WARNING,
    RTLOG_ERROR,
    RTLOG_FAIL,
    RTLOG_FATAL,
    RTLOG_OFF
};

struct HeapParam {
    size_t regionSize;
    size_t heapSize;
    double exemptionThreshold;
    double heapUtilization;
    double heapGrowth;
    double allocationRate;
    size_t allocationWaitTime;
};

struct GCParam {
    size_t gcThreshold;
    double garbageThreshold;
    uint64_t gcInterval;
    uint64_t backupGCInterval;
    int32_t gcThreads;
};

struct LogParam {
    enum RTLogLevel logLevel;
};

struct ConcurrencyParam {
    size_t thStackSize;
    size_t coStackSize;
    uint32_t processorNum;
};

struct RuntimeParam {
    struct HeapParam heapParam;
    struct GCParam gcParam;
    struct LogParam logParam;
    struct ConcurrencyParam coParam;
};

enum SemiCJThreadState {
    SEMI_CJTHREAD_INIT,
    SEMI_CJTHREAD_SUSPENDING,
    SEMI_CJTHREAD_RUNNING,
    SEMI_CJTHREAD_DONE,
};

enum RTErrorCode InitCJRuntime(const struct RuntimeParam* param);
enum RTErrorCode FiniCJRuntime(void);
void* InitUIScheduler(void);
enum RTErrorCode RunUIScheduler(unsigned long long timeout);
enum RTErrorCode SetCJCommandLineArgs(int argc, const char* argv[]);

CJThreadHandle RunCJTask(const CJTaskFunc func, void* args);
CJThreadHandle RunCJTaskToSchedule(const CJTaskFunc func, void* args, void* schedule);
CJThreadHandle RunCJTaskWithLocal(const CJTaskFunc func, void* args, struct CJThreadSpecificData* data, int num);
int GetTaskRet(const CJThreadHandle handle, void** ret);
int GetTaskRetWithTimeout(const CJThreadHandle handle, void** ret, int64_t timeout);
void ReleaseHandle(const CJThreadHandle handle);

SemiCJThreadHandle CreateCJThread(const CJTaskFunc func, void* arg, struct CJThreadSpecificData* data, int num);
int ResumeCJThread(SemiCJThreadHandle co);
int GetCJThreadState(SemiCJThreadHandle co);
void* GetCJThreadResult(SemiCJThreadHandle co);
int DestoryCJThread(SemiCJThreadHandle co);

int CJThreadKeyCreate(CJThreadKey* key, DestructorFunc destructor);
int CJThreadSetspecific(CJThreadKey key, void* value);
void* CJThreadGetspecific(CJThreadKey key);
int SuspendSchedule(void);
int ResumeSchedule(void);
bool AnyTask(void);
char* CJ_MRT_DemangleHandle(const char* functionName);

int LoadCJLibrary(const char* libName);
int InitCJLibrary(const char* libName);
int LoadCJLibraryWithInit(const char* libName);
void* FindCJSymbol(const char* libName, const char* symbolName);
int UnloadCJLibrary(const char* libName);

#endif
