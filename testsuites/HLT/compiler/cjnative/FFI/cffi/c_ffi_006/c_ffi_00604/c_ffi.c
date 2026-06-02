/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

char* testfunc(char* a, char* b, char* c, int num1, int num2) {
    if (num1 > num2)
    {
        char *ret = a;  //[3]
        while ((*a++=*b++)!='\0') {} //[4]
        return ret;
    } else {
        return c;
    }
    return a;
}
