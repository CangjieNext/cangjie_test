/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

int testfunc1(char* str_arg, int num_arg, ...)
{
    int count = 0;
    if (str_arg != NULL && strcmp(str_arg, "abc") == 0) {
        count += 1;
    }
    va_list ap;
    int i;
    char* str_arg2;
    va_start(ap, num_arg);
    for (i = 0; i < num_arg; i++) {
        str_arg2 = va_arg(ap, char*);
        if (str_arg2 != NULL && strcmp(str_arg2, "abc") == 0) {
            count += 1;
        }
    }
    va_end(ap);

    if (count == 2) {
        return 0;
    } else {
        return 1;
    }
}
