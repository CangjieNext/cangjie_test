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
    long long z;
} BiggerStruct;

BiggerStruct PassStructToC_6S(BiggerStruct a, BiggerStruct b, BiggerStruct c, BiggerStruct d, BiggerStruct e,
                              BiggerStruct f)
{
    printf("func PassStructToC_6S\n");
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", a.x, a.y, a.z);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", b.x, b.y, b.z);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", c.x, c.y, c.z);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", d.x, d.y, d.z);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", e.x, e.y, e.z);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", f.x, f.y, f.z);
    printf("\n");
    return a;
}

BiggerStruct PassStructToC_6int1S(int a, int b, int c, int d, int e, int f, BiggerStruct fff)
{
    printf("func PassStructToC_6int1S\n");
    printf("6int = %d,%d,%d,%d,%d,%d\n", a, b, c, d, e, f);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", fff.x, fff.y, fff.z);
    printf("\n");
    return fff;
}

int PassStructToC_6int(int a, int b, int c, int d, int e, int f, int g)
{
    printf("6int = %d,%d,%d,%d,%d,%d,%d\n", a, b, c, d, e, f, g);
    printf("\n");
    return 0;
}

BiggerStruct PassStructToC_1S6int(BiggerStruct fff, int a, int b, int c, int d, int e, int f)
{
    printf("func PassStructToC_1S6int\n");
    printf("6int = %d,%d,%d,%d,%d,%d\n", a, b, c, d, e, f);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", fff.x, fff.y, fff.z);
    printf("\n");
    return fff;
}

BiggerStruct PassStructToC_3int1S3int1S(int a, int b, int c, BiggerStruct eee, int d, int e, int f, BiggerStruct fff)
{
    printf("func PassStructToC_3int1S3int1S\n");
    printf("6int = %d,%d,%d,%d,%d,%d\n", a, b, c, d, e, f);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", eee.x, eee.y, eee.z);
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", fff.x, fff.y, fff.z);
    printf("\n");
    return fff;
}