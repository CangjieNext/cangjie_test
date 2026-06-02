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
    double f64;
    double* pf64;
} teststruct;

teststruct testfunc1()
{
    teststruct cjstruct;
    cjstruct.f64 = 1.0;
    cjstruct.pf64 = (double*)malloc(sizeof(double) * 4);
    memset(cjstruct.pf64, 0, 4);
    cjstruct.pf64[0] = 1.0;
    cjstruct.pf64[1] = 2.0;
    cjstruct.pf64[2] = 3.0;
    return cjstruct;
}

teststruct testfunc2(teststruct ts)
{
    if ((ts.f64 == 2.0) && (ts.pf64[0] = 4.0) && (ts.pf64[1] = 5.0) && (ts.pf64[2] = 6.0)) {
        ts.f64 += 1.0;
        ts.pf64[0] += 1.0;
        ts.pf64[1] += 1.0;
        ts.pf64[2] += 1.0;
    }

    return ts;
}
