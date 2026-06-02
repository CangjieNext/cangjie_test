/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>

int32_t testfunc1(int32_t num_arg, ...)
{
    int32_t val = 0;
    va_list ap;
    int32_t i;

    va_start(ap, num_arg);
    for (i = 0; i < num_arg; i++) {
        val += va_arg(ap, int32_t);
    }
    va_end(ap);

    return val;
}

int32_t testfunc2(int32_t num_arg1, int32_t num_arg2, ...)
{
    int32_t val = 0;
    va_list ap;
    int32_t i;

    va_start(ap, num_arg2);
    for (i = 0; i < num_arg2; i++) {
        val += va_arg(ap, int32_t);
    }
    va_end(ap);
    val += num_arg1;

    return val;
}
