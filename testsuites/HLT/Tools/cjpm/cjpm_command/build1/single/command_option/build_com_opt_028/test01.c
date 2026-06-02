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

uint16_t* testfunc() {
    uint16_t* ptr = (uint16_t*)malloc(sizeof(uint16_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = 0;
    ptr[1] = 2;
    ptr[2] = 65535;
    return ptr;
}
