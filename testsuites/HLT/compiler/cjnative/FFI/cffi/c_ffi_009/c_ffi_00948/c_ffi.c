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
    float f32a;
    float f32b;
    float f32c;
    float f32d;
};

int8_t testfunc(struct teststruct ts)
{
    if ((ts.f32a - 1.0 < 1e-6) && (ts.f32b - 2.0 < 1e-6) && (ts.f32c - 3.0 < 1e-6) && (ts.f32d - 4.0 < 1e-6)) {
        return 0;
    } else {
        return 1;
    }
}
