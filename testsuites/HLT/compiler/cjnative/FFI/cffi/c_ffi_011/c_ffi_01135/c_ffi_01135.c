/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <stdio.h>

int* AllocCPointer()
{
    int* p = malloc(sizeof(int));
    return p;
}

typedef int* (*compare)(int*);

int* Max(int* x)
{
    *x = *x + 1;
    printf("x: %d\n", *x);
    return x;
};

compare GetMaxFuncPtr()
{
    int* (*ret)(int*) = &Max;
    return ret;
}
