// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdio.h>
#include <stdlib.h>

int fuzz(void (*api)(char*, char*))
{
    api("hello", "world");
    return 0;
}

int fuzz2(void (*api)(int*, int*))
{
    int* a = (int*)malloc(sizeof(int));
    int* b = (int*)malloc(sizeof(int));
    *a = 3;
    *b = 4;
    api(a, b);
    free(a);
    free(b);
    return 0;
}

int* getCPtrInt()
{
    int* a = (int*)malloc(sizeof(int) * 3);
    a[0] = 3;
    a[1] = 4;
    a[2] = 5;
    printf("pass to CJ a: %d\n", *a);
    return a;
}
