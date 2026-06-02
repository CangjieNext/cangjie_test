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
#include <string.h>

typedef struct {
    float f32;
    float* pf32;
} teststruct;

teststruct testfunc1()
{
    teststruct cjstruct;
    cjstruct.f32 = 1.0;
    cjstruct.pf32 = (float*)malloc(sizeof(float) * 4);
    memset(cjstruct.pf32, 0, 4);
    cjstruct.pf32[0] = 1.0;
    cjstruct.pf32[1] = 2.0;
    cjstruct.pf32[2] = 3.0;
    return cjstruct;
}

teststruct testfunc2(teststruct ts)
{
    if ((ts.f32 == 2.0) && (ts.pf32[0] = 4.0) && (ts.pf32[1] = 5.0) && (ts.pf32[2] = 6.0)) {
        ts.f32 += 1.0;
        ts.pf32[0] += 1.0;
        ts.pf32[1] += 1.0;
        ts.pf32[2] += 1.0;
    }

    return ts;
}
