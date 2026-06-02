/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>

typedef struct {
    long long x;
    long long y;
} SmallStruct;

typedef struct {
    double x;
    double y;
} SmallFloatStruct;

SmallStruct PassStructToC_6S(SmallStruct a)
{
    printf("func PassStructToC_6S\n");
    printf("change CJ struct: x -> %lld , y -> %lld\n", a.x, a.y);
    a.x = 11;
    a.y = 12;
    return a;
}

SmallFloatStruct PassFloatStructToC_6S(SmallFloatStruct a)
{
    printf("\nfunc PassFloatStructToC_6S\n");
    printf("change CJ struct: x -> %lf , y -> %lf\n", a.x, a.y);
    a.x = 11.0;
    a.y = 12.0;
    return a;
}
