// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdlib.h>

struct Data {
    uint32_t c;
    int8_t i8;
    uint8_t ui8;
    int16_t i16;
    uint16_t ui16;
};

void* MallocWithZero(size_t size)
{
    if (size == 0) {
        return NULL;
    }
    void* ptr = calloc(size, 1);
    if (ptr == NULL) {
        return NULL;
    }

    return ptr;
}

struct Data* Update(int n, struct Data* pst)
{
    if ((pst->c == 'a') && (pst->i8 == 127) && (pst->ui8 == 255) && (pst->i16 == 32767) && (pst->ui16 == 65535)) {
        pst->c = 'b';
        pst->i8 -= n;
        pst->ui8 -= n;
        pst->i16 -= n;
        pst->ui16 -= n;
    }

    return pst;
}
