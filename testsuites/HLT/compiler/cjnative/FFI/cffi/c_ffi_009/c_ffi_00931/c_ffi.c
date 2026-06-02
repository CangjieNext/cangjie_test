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
    float f32a;
    float f32b;
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
    if ((pst->f32a - 34028235612225536.000000 < 1e-6) && (pst->f32b - 34028235612225536.000000 < 1e-6)) {
        pst->f32a -= (float)n;
        pst->f32b -= (float)n;
    }

    return pst;
}
