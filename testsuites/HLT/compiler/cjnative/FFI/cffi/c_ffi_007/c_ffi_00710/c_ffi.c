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

uint32_t* testfunc()
{
    uint32_t* ptr = (uint32_t*)malloc(sizeof(uint32_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }

    ptr[0] = 0;
    ptr[1] = 2;
    ptr[2] = 4294967295;
    return ptr;
}
