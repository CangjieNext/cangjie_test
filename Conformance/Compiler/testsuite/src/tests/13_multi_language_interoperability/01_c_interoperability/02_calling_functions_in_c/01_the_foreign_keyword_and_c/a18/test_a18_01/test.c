/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>
#include <stdarg.h>

int32_t func_01(int32_t n, ...) {
    va_list args;
    va_start(args, n);
    int32_t sum = 0;
    for (int i = 0; i < n; ++i) {
        int arg = va_arg(args, int);
        sum += arg;
    }
    va_end(args);
    return sum;
}
