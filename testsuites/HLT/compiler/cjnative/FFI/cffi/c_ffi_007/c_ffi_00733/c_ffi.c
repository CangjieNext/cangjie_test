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

int8_t* testfunc() {
    int8_t* ptr = (int8_t*)malloc(sizeof(int8_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = 97;
    ptr[1] = 98;
    ptr[2] = 99;
    return ptr;
}
