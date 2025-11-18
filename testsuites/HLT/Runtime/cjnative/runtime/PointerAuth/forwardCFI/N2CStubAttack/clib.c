/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>
#include <dlfcn.h>
#include <stdbool.h>
#define _GNU_SOURCE
#include <sched.h>
#include <signal.h>
#include <dlfcn.h>
#include <sigchain.h>

// The reason why we use independent signal handler and add_special_signal_handler API is that
// the runtime cannot handle this error correctly.
// It will trigger SIGSEGV in unwind procedure.
// To fix this, we use add_special_signal_handler in OHOS so that our handler will be triggered
// before it reaches runtime's handler.
bool sigill_handler(int signal, siginfo_t *info, void *context) {
    if (info->si_code == ILL_ILLOPN) {
        fprintf(stderr, "SIGILL\n");
        exit(132);
    } else {
        fprintf(stderr, "Unexpect SIGILL with code: %d\n", info->si_code);
        exit(-1);
    }
    return true;
}

__attribute__((constructor)) void init() {
    cpu_set_t  mask;
    CPU_ZERO(&mask);
    CPU_SET(0, &mask);
    sched_setaffinity(0, sizeof(mask), &mask);
	fprintf(stderr, "cpu setting is done\n");

    struct signal_chain_action act = { 0 };
    act.sca_flags = SA_RESTART | SA_SIGINFO;
    act.sca_sigaction = &sigill_handler;
    add_special_signal_handler(SIGILL, &act);
    fprintf(stderr, "add_special_signal_handler is done\n");
}

unsigned long getTargetFuncAddr(char *funcName) {
    void *handle = dlopen("libcangjie-runtime.so", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "open libcangjie-runtime.so failed, errno = %d\n", errno);
        exit(-1);
    }

    unsigned long addr = (unsigned long)dlsym(handle, funcName);
    fprintf(stderr, "get %s -> %lx\n", funcName, addr);
    return addr;
}

unsigned long *getGotAddr(unsigned long funcAddr) {
    FILE *fp = fopen("/proc/self/maps", "r");
    if (fp == NULL) {
        fprintf(stderr, "cannot open proc file, errno = %d\n", errno);
        exit(-1);
    }

    char line[1024];
    bool succ = false;
    while (fgets(line, sizeof(line), fp)) {
        static int count = 0;
        // fprintf(stderr, "%s\n", line);   
        if (strstr(line, "libcangjie-runtime") == NULL || strstr(line, "r--p") == NULL) {
            continue;
        }
        count += 1;
        if (count == 2) {
            succ = true;
            break;
        }
    }
    fclose(fp);

    if (!succ) {
        fprintf(stderr, "cannot find libcangjie-runtime.so data segment map\n");
        exit(-1);
    }

    // fprintf(stderr, "get -> %s\n", line);
    unsigned long start, end;
    sscanf(line, "%lx-%lx", &start, &end);
    fprintf(stderr, "get data segment %lx - %lx\n", start, end);
    for (unsigned long *ptr = (unsigned long *)start; ((unsigned long)ptr) < end; ptr = (unsigned long *)((unsigned long)ptr + 8)) {
        if (*ptr == funcAddr) {
            fprintf(stderr, "found %lx\n", ptr);
            return ptr;
        }
    }

    return NULL;
}

unsigned long oriFuncAddr = 0;
typedef void (*func_ptr)();
#define PAGE_SIZE 4096
#define PAGE_ALIGN_DOWN(x) (x & ~(PAGE_SIZE - 1))

void badFunc() {
    puts("this is bad func");
    void *sp2 = __builtin_frame_address(2);
    unsigned long *target_pos = (unsigned long*)((unsigned long)sp2 - 320 + 176 + 8);
    fprintf(stderr, "badFunc: p2 = %lx, target = %lx, *target = %lx\n", (unsigned long)sp2, (unsigned long)target_pos, (unsigned long)*target_pos);
    fprintf(stderr, "badFunc: *(p2 - 1) = %lx, *(p2) = %lx, *(p2 + 1) = %lx\n", *((unsigned long*)sp2 - 1), *((unsigned long*)sp2), *((unsigned long*)sp2 + 1));
    func_ptr oriFunc = (func_ptr)oriFuncAddr;
    oriFunc();
    *target_pos = 0xdeadbeef;
}
void tamperGot(unsigned long *gotAddr, unsigned long funcAddr) {
    oriFuncAddr = *gotAddr;
    unsigned long start = PAGE_ALIGN_DOWN((unsigned long)gotAddr);
    fprintf(stderr, "mprotect %lx ~ %lx\n", start, start + PAGE_SIZE);
    int ret = mprotect((void *)start, PAGE_SIZE, PROT_READ | PROT_WRITE);
    if (ret == -1) {
        fprintf(stderr, "mprotect failed, errno = %d\n", errno);
        exit(-1);
    }

    *gotAddr = funcAddr;
    ret = mprotect((void *)start, PAGE_SIZE, PROT_READ);
    if (ret == -1) {
        fprintf(stderr, "mprotect failed, errno = %d\n", errno);
        exit(-1);
    }
}


void hook() {
    unsigned long funcAddr = getTargetFuncAddr("MRT_TryNewAndRunCJThread");
    unsigned long *got = getGotAddr(funcAddr);
    tamperGot(got, (unsigned long)badFunc);
}

void cfunc(void (*cjFunc)(void)) {
    fprintf(stderr, "this is cfunc, cjfunc is %lx\n", (unsigned long)cjFunc);
    void *sp0 = __builtin_frame_address(0);
    fprintf(stderr, "badFunc: p0 = %lx, *(p0 - 1) = %lx, *(p0) = %lx, *(p0 + 1) = %lx\n", (unsigned long)sp0, *((unsigned long*)sp0 - 1), *((unsigned long*)sp0), *((unsigned long*)sp0 + 1));
    cjFunc();
}