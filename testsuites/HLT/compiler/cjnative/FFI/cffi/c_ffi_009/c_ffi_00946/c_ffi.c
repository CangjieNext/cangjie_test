/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

struct teststruct {
    float f32a;
    float f32b;
    float f32c;
    float f32d;
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

struct teststruct* testfunc(float n, struct teststruct* pst)
{
    if ((pst->f32a - 1.0 < 1e-6) && (pst->f32b - 2.0 < 1e-6) && (pst->f32c - 3.0 < 1e-6) && (pst->f32d - 4.0 < 1e-6)) {
        pst->f32a += n;
        pst->f32b += n;
        pst->f32c += n;
        pst->f32d += n;
    }

    return pst;
}
