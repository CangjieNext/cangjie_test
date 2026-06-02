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

struct teststruct {
    double f64a;
    double f64b;
    double f64c;
    double f64d;
};

int8_t testfunc(struct teststruct ts)
{
    if ((ts.f64a - 1.0 < 1e-16) && (ts.f64b - 2.0 < 1e-16) && (ts.f64c - 3.0 < 1e-16) && (ts.f64d - 4.0 < 1e-16)) {
        return 0;
    } else {
        return 1;
    }
}
