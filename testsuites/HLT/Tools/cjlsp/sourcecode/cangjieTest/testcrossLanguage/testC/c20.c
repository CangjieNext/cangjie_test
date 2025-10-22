/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint-gcc.h>
#include <stdarg.h>

float testpara3(int64_t num_arg, ...)
{
    float val = 0;
    va_list ap;
    int64_t i;

    va_start(ap, num_arg);
    for (i = 0; i < num_arg; i++) {
        float num = va_arg(ap, double);
        val += num;
    }
    va_end(ap);

    return val;
}

float testpara4(float num_arg1, int64_t num_arg2, ...)
{
    float val = 0;
    va_list ap;
    int64_t i;

    va_start(ap, num_arg2);
    for (i = 0; i < num_arg2; i++) {
        val += va_arg(ap, double);
    }
    va_end(ap);
    val += num_arg1;

    return val;
}
