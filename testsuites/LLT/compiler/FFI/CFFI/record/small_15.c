// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

uint8_t* GetCPtr()
{
    uint8_t* ptr = (uint8_t*)malloc(10);
    printf("GetCPtr: %p\n", ptr);
    for (size_t i = 0; i < 10; i++) {
        *(ptr + i) = i;
    }
    return ptr;
}

typedef struct {
    uint8_t* ptr;
    uint64_t size;
} ArrayU8;

uint64_t UseCArray(ArrayU8 au0, ArrayU8 au1, bool flag, ArrayU8 au2)
{
    printf("UseCArray: {%p, %lu}\n", au0.ptr, au0.size);
    printf("UseCArray: {%p, %lu}\n", au1.ptr, au1.size);
    printf("UseCArray: {%p, %lu}\n", au2.ptr, au2.size);
    uint64_t sum = 0;
    for (size_t i = 0; i < au0.size; i++) {
        sum += *(au0.ptr + i);
    }
    for (size_t i = 0; i < au1.size; i++) {
        sum += *(au1.ptr + i);
    }
    for (size_t i = 0; i < au2.size; i++) {
        sum += *(au2.ptr + i);
    }
    sum += flag ? 1 : 0;
    return sum;
}
