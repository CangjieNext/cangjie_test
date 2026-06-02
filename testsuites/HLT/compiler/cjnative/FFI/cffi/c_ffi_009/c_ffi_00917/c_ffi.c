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
#include <stddef.h>

struct teststruct {
    int32_t a;
    int32_t b;
    int32_t c;
    int32_t d;
    int32_t e;
};

void* MallocWithZero(size_t size)
{
    if (size == 0) {
        return NULL;
    }
    void* ptr = calloc(size, sizeof(int32_t));
    if (ptr == NULL) {
        return NULL;
    }

    return ptr;
}

struct teststruct* testfunc(int32_t n, struct teststruct* pst)
{
    if ((pst->a == -111) && (pst->b == 111) && (pst->c == -111) && (pst->d == 111) && (pst->e == -111)) {
        printf("pass1\n");
    }
    pst->a -= n;
    pst->b += n;
    pst->c -= n;
    pst->d += n;
    pst->e -= n;

    return pst;
}