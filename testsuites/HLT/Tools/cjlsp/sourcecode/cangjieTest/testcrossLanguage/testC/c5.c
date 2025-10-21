/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint-gcc.h>
#include <stdlib.h>
#include <string.h>

char* my_strcat(char* dest, const char* src)
{
    char* n = dest;
    while(*n != 0) {++n;}
    while((*n++ = *src++) != 0) {}
    return dest;
}

char* cstrfunchar(char* a)
{
    char* c = (char*)malloc(sizeof(char) * 30);
    memset(c, 0, 30);
    char* b = " world";
    my_strcat(c, a);
    my_strcat(c, b);
    return c;
}

char* getcstrchar()
{
    char* a = "hello";
    char* c = (char*)malloc(sizeof(char) * 30);
    memset(c, 0, 30);
    my_strcat(c, a);
    return c;
}
