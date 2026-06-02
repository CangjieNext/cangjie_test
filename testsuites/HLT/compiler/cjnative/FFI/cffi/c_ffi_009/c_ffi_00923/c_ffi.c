/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>

struct teststruct {
    uint64_t ui64;
    float f32;
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
    if ((pst->ui64 == 18) && (pst->f32 - 34028235612225536.000000 < 1e-6)) {
        pst->ui64 -= (uint64_t)n;
        pst->f32 -= (float)n;
    }

    return pst;
}
