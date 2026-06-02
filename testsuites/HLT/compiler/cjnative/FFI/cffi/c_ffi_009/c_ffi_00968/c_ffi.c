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

struct teststruct {
    bool b;
    uint32_t ui32a;
    int8_t i8;
    uint8_t ui8;
    int16_t i16;
    uint16_t ui16;
    int8_t (*testfunc)(int8_t i8a, int8_t i8b);
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

struct teststruct* testfunc(int n, struct teststruct* pst)
{
    if ((pst->b == true) && (pst->ui32a == 'a') && (pst->i8 == 127) && (pst->ui8 == 255) && (pst->i16 == 32767) &&
        (pst->ui16 == 65535)) {
        pst->b = false;
        pst->ui32a = 'b';
        pst->i8 -= (int8_t)n;
        pst->ui8 -= (uint8_t)n;
        pst->i16 -= (int16_t)n;
        pst->ui16 -= (uint16_t)n;
    }

    return pst;
}
