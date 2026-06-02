/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>

struct teststruct {
    int32_t a;
    int32_t b;
    int32_t c;
    int32_t d;
    int32_t e;
    int flags;
    int family;
    int socktype;
    int protocol;
    int addrlen;
    void* addr;
    char* canonname;
    struct teststruct* next;
};

void* MallocWithZero(size_t size)
{
    if (size == 0) {
        return NULL;
    }
    void* ptr = malloc(size);
    if (ptr == NULL) {
        return NULL;
    }
    memset(ptr, 0, size);
    return ptr;
}

void** GetDoublePtr()
{
    void** ptr = (void**)calloc(1, sizeof(void*));
    return ptr;
}

struct teststruct** testfunc(int n, struct teststruct** ppst)
{
    if (((**ppst).a == -111) && ((**ppst).b == 111) && ((**ppst).c == -111) && ((**ppst).d == 111) &&
        ((**ppst).e == -111)) {
        printf("pass1\n");
    }
    (**ppst).a -= n;
    (**ppst).b += n;
    (**ppst).c -= n;
    (**ppst).d += n;
    (**ppst).e -= n;

    return ppst;
}
