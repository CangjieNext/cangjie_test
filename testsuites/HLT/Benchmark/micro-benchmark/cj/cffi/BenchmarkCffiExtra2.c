/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct data_13{
    uint32_t a0;
    uint32_t a1;
    uint32_t a2;
    uint8_t a3;
} StructData;

StructData* getptr(int8_t num1, int16_t num2, int32_t num3, int64_t num4) {
    StructData* ptr = (StructData*)malloc(sizeof(StructData));
    ptr->a0 = num1;
    ptr->a1 = num2;
    ptr->a2 = num3;
    ptr->a3 = num4;
    return ptr;
}

int32_t testfunc(StructData *Data, uint32_t Size){
    int32_t res = Data->a0 + Data->a1 + Data->a2 + Data->a3 + Size;
    return res;
};