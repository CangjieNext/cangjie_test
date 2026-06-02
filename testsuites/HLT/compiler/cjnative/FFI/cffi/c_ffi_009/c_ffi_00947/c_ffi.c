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
    double f64a;
    double f64b;
    double f64c;
    double f64d;
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

struct teststruct* testfunc(double n, struct teststruct* pst)
{
    if ((pst->f64a - 1.0 < 1e-16) && (pst->f64b - 2.0 < 1e-16) && (pst->f64c - 3.0 < 1e-16) &&
        (pst->f64d - 4.0 < 1e-16)) {
        pst->f64a += n;
        pst->f64b += n;
        pst->f64c += n;
        pst->f64d += n;
    }

    return pst;
}
