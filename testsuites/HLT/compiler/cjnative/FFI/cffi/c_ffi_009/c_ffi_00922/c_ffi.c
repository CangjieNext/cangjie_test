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
    int32_t i32;
    uint32_t ui32b;
    int64_t i64;
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
    if ((pst->i32 == 2147483647) && (pst->ui32b == 4294967295) && (pst->i64 == 9223372036854770000)) {
        pst->i32 -= n;
        pst->ui32b -= (uint32_t)n;
        pst->i64 -= (int64_t)n;
    }

    return pst;
}
