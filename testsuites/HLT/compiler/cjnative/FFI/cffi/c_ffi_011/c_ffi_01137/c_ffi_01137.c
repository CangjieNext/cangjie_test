/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

char* AllocCPointer()
{
    char* str1 = "cang";
    return str1;
}

typedef char*(*compare)(char*);

char* Max(char* x) {
    char* y = "jie";
    char* z = (char*)malloc(1 + strlen(x) + strlen(y));
    strcpy(z, x);
    strcat(z, y);
    printf("z: %s\n", z);
    return z;
};

compare GetMaxFuncPtr()
{
    char* (*ret)(char*) = &Max;
    return ret;
}
