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

uint64_t* testfunc() {
    uint64_t* ptr = (uint64_t*)malloc(sizeof(uint64_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = 3;
    ptr[1] = 6;
    ptr[2] = 9;
    return ptr;
}
