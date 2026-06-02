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
#include <string.h>
#include <stdio.h>
#include <stddef.h>

#define LEN 100

const char *func_01(const char *fmt, ...) {
    va_list args;
    va_start(args, fmt);
    char result[LEN];
    size_t length = 0;
    memset_s(result, LEN, 0, LEN);
    while (*fmt != '\0') {
        if (*fmt == '%') {
            ++fmt;
            if (*fmt == 'd') {
                int val = va_arg(args, int);
                sprintf_s(result + length, LEN - length, "%d", val);
                ++fmt;
            } else if (*fmt == 'f') {
                double val = va_arg(args, double);
                sprintf_s(result + length, LEN - length, "%f", val);
                ++fmt;
            } else if (*fmt == 's') {
                const char *val = va_arg(args, const char *);
                sprintf_s(result + length, LEN - length, "%s", val);
                ++fmt;
            } else {
                strncpy_s(result + length, LEN - length, fmt - 1, 2);
                ++fmt;
            }
            length = strlen(result);
        } else {
            result[length++] = *fmt++;
        }
        if (length >= LEN - 1)
            {break;}
    }
    va_end(args);
    result[length] = 0;
    return strdup(result);
}
