// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int memset_s(void *dest, size_t destMax, int c, size_t count);

struct teststruct {
    int32_t a;
    int32_t b;
    int32_t c;
    int32_t d;
    int32_t e;
    int64_t flags;
    int64_t family;
    int64_t socktype;
    int64_t protocol;
    int64_t addrlen;
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
    if (memset_s(ptr, size, 0, size) != 0) {
        return NULL;
    }
    return ptr;
}

void** GetDoublePtr()
{
    printf("size of teststruct is : %d\n", sizeof(struct teststruct));
    void** ptr = (void**)calloc(1, sizeof(void*));
    return ptr;
}

struct teststruct** testfunc(int8_t n, struct teststruct** ppst)
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