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

typedef struct {
    float f32;
    double f64;
} teststruct;

teststruct struct1 = {1.0, 1.0};

teststruct* AllocCStruct()
{
    teststruct* p = malloc(sizeof(teststruct));
    if (p == NULL) {
        return NULL;
    }
    p[0] = struct1;
    return p;
}

teststruct* testfunc() {
    struct teststruct *ptr = &struct1;
    return ptr;
}
