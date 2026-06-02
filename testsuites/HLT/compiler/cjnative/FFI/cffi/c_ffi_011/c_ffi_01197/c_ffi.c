/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

void* get_cptr(void*(*ptr)(void*)) {
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    if (ptrtmp == NULL) {
        return NULL;
    }
    ptrtmp[0] = 47;
    ptrtmp[1] = 48;
    ptrtmp[2] = 49;
    return (void*)ptrtmp;
}

void* getCPtrVoid()
{
    int8_t* a = (int8_t*)malloc(sizeof(int8_t));
    if (a == NULL) {
        return NULL;
    }
    *a = 127;
    printf("pass to CJ void a: %d\n", *a);
    return (void*)a;
}
