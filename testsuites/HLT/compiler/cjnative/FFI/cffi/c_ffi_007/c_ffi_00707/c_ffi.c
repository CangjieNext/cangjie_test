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

int64_t* testfunc()
{
    int64_t* ptr = (int64_t*)malloc(sizeof(int64_t) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = -9223372036854775808;
    ptr[1] = 0;
    ptr[2] = 9223372036854775807;
    return ptr;
}
