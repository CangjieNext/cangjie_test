/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include <unistd.h>
#include <pthread.h>

#ifndef NO_INLINE
    #if __has_attribute(visibility)
        #define NO_INLINE     __attribute__ ((noinline))
    #endif
#endif

NO_INLINE void* GetStackPointer(void) {
    return __builtin_frame_address(0);
}

typedef struct _Result {
    uint64_t thread_id;
    uint64_t page_size;
    uint64_t stack_pointer;
    uint64_t stack_base;
    uint64_t stack_size;
    uint64_t guard_size;
} Result;

#define ASSERT_ZERO(expression)    \
    do {                             \
        int rc = (expression);         \
        assert(rc == 0);               \
    } while (0)

void Check(Result* result) {
    pthread_t self = pthread_self();
    pthread_attr_t attributes;
    void* stack_base = NULL;
    size_t stack_size = 0;
    size_t guard_size = 0;

    result->thread_id = gettid();
    result->page_size = getpagesize();
    result->stack_pointer = (uint64_t)GetStackPointer();
    result->stack_base = 0;
    result->stack_size = 0;
    result->guard_size = 0;

    ASSERT_ZERO(pthread_getattr_np(self, &attributes));
    ASSERT_ZERO(pthread_attr_getstack(&attributes, &stack_base, &stack_size));
    ASSERT_ZERO(pthread_attr_getguardsize(&attributes, &guard_size));
    ASSERT_ZERO(pthread_attr_destroy(&attributes));
    result->stack_base = (uint64_t)stack_base;
    result->stack_size = (uint64_t)stack_size;
    result->guard_size = (uint64_t)guard_size;
}

// Cangjie.h BEGIN

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

enum RTLogLevel {
    RTLOG_VERBOSE,
    RTLOG_DEBUGY,
    RTLOG_INFO,
    RTLOG_WARNING,
    RTLOG_ERROR,
    RTLOG_FATAL_WITHOUT_ABORT,
    RTLOG_FATAL,
    RTLOG_OFF
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

extern int InitCJRuntime(const struct RuntimeParam* param);
extern int LoadCJLibraryWithInit(const char* libName);

// Cangjie.h END

extern int32_t cj_workload(int32_t withExclusiveScope, void(*check)(Result*));

int main(int argc, const char** argv) {
    int32_t withExclusiveScope = 0;
    struct RuntimeParam param = {0};
    param.logParam.logLevel = RTLOG_ERROR;
    InitCJRuntime(&param);
    LoadCJLibraryWithInit("libc_interop.so");
    if (argc != 2) {
        printf("./app [yn]\n");
        return 1;
    }

    if (!strcmp(argv[1], "y")) {
        withExclusiveScope = 1;
    } else if (!strcmp(argv[1], "n")) {
        withExclusiveScope = 0;
    } else {
        printf("./app [yn]\n");
        return 1;
    }

    if (cj_workload(withExclusiveScope, Check) != 0) {
        printf("OK\n");
        return 0;
    } else {
        printf("FAIL\n");
        return 1;
    }
}
