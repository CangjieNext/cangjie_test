/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int8_t** testfunc()
{
    int8_t* ptr = (int8_t*)malloc(sizeof(int8_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }

    int8_t** array = (int8_t**)malloc(sizeof(ptr) * 1);
    if (array == NULL) {
        return NULL;
    }
    array[0] = ptr;
    array[0][0] = -128;
    array[0][1] = 0;
    array[0][2] = 127;
    return array;
}
