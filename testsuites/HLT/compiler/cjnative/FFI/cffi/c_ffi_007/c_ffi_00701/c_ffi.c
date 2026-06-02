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

void* testfunc()
{
    int* ptr = (int*)malloc(sizeof(int) * 2);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = 1;
    ptr[1] = 2;
    return (void*)ptr;
}
