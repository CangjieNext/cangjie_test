/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int32_t* PassInt32PointerToCangjie()
{
    int32_t* a = (int32_t*)malloc(sizeof(int32_t));
    if (a == NULL) {
        return NULL;
    }
    *a = 123;
    return a;
}
