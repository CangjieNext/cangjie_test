// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdlib.h>
#include <stdint.h>

void PlusOne(int32_t* ptr)
{
    if (ptr == NULL) {
        return;
    }
    *ptr += 1;
}

void PlusTwo(int64_t* ptr)
{
    if (ptr == NULL) {
        return;
    }
    *ptr += 2;
}

typedef struct {
    int8_t a;
    int16_t b;
    int32_t c;
    int64_t d;
} Data;

void PlusOneEachField(Data* data)
{
    if (data == NULL) {
        return;
    }
    data->a += 1;
    data->b += 1;
    data->c += 1;
    data->d += 1;
}

void MemAlloc(int64_t** ptr)
{
    if (ptr == NULL || *ptr != NULL) {
        return;
    }
    *ptr = malloc(sizeof(int64_t));
    **ptr = 0l;
}

void PlusTen(int64_t* ptr1, int32_t* ptr2, Data* ptr3)
{
    (*ptr1) += 10;
    (*ptr2) += 10;
    ptr3->a += 10;
    ptr3->b += 10;
    ptr3->c += 10;
    ptr3->d += 10;
}

typedef void (*cfunc_t)(int64_t* ptr1, int32_t* ptr2, Data* ptr3);
void ReplaceCallback(cfunc_t* ptr)
{
    (*ptr) = PlusTen;
}
