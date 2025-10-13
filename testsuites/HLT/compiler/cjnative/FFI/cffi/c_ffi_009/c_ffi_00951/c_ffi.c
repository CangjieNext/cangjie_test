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
#include <securec.h>

struct teststruct {
    int8_t num;
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
    void** ptr = (void**)calloc(1, sizeof(void*));
    return ptr;
}

struct teststruct** testfunc(int8_t num, struct teststruct** ppst)
{
    (**ppst).num = 10;
    return ppst;
}
