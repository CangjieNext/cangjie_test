/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include "case11.h"

int C_Func(int a1, long long a2, int a3, long long a4, int a5, long long a6, int a7, long long a8, int a9,
           long long a10)
{
    printf("C_Func:%d\n", a1);
    printf("C_Func:%lld\n", a2);
    printf("C_Func:%d\n", a3);
    printf("C_Func:%lld\n", a4);
    printf("C_Func:%d\n", a5);
    printf("C_Func:%lld\n", a6);
    printf("C_Func:%d\n", a7);
    printf("C_Func:%lld\n", a8);
    printf("C_Func:%d\n", a9);
    printf("C_Func:%lld\n", a10);
    int result = C2CJ_Func(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
    printf("C_Func:%d\n", result);
    return result;
}