// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdio.h>

typedef struct {
    long long x;
    long long y;
    long long z;
} BiggerStruct;

/// This type will do not RVO.
typedef struct {
    int a;
} SmallerStruct;

SmallerStruct PassStructToCS(SmallerStruct p)
{
    printf("get from CJ struct: a -> %d\n", p.a);
    p.a = 5;
    printf("change CJ struct: a -> %d\n", p.a);
    return p;
}

unsigned char PassStructToCS_Int8(SmallerStruct p)
{
    printf("get from CJ struct: a -> %d\n", p.a);
    p.a = 5;
    printf("change CJ struct: a -> %d\n", p.a);
    return 8;
}

void PassStructToCS_Unit(SmallerStruct p)
{
    printf("get from CJ struct: a -> %d\n", p.a);
    p.a = 5;
    printf("change CJ struct: a -> %d\n", p.a);
}

BiggerStruct PassStructToC(BiggerStruct p)
{
    printf("get from CJ struct: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    p.x = 5;
    p.y = 6;
    p.z = 7;
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    return p;
}

unsigned char PassStructToC_Int8(BiggerStruct p)
{
    printf("get from CJ struct: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    p.x = 5;
    p.y = 6;
    p.z = 7;
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    return 58;
}

void PassStructToC_Unit(BiggerStruct p)
{
    printf("get from CJ struct: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    p.x = 5;
    p.y = 6;
    p.z = 7;
    printf("change CJ struct: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
}

BiggerStruct PassStructToC2(BiggerStruct p, int a, BiggerStruct p2, int b, BiggerStruct p3, int c)
{
    printf("get int a -> %d , b -> %d , c -> %d\n", a, b, c);
    printf("get from CJ struct1: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    printf("get from CJ struct2: x -> %lld , y -> %lld , z -> %lld\n", p2.x, p2.y, p2.z);
    printf("get from CJ struct3: x -> %lld , y -> %lld , z -> %lld\n", p3.x, p3.y, p3.z);
    return p;
}

SmallerStruct PassStructToCS2(SmallerStruct p, int a, SmallerStruct p2, int b, SmallerStruct p3, int c)
{
    printf("get int a -> %d , b -> %d , c -> %d\n", a, b, c);
    printf("get from CJ struct1: a -> %d\n", p.a);
    printf("get from CJ struct2: a -> %d\n", p2.a);
    printf("get from CJ struct3: a -> %d\n", p3.a);
    return p;
}

BiggerStruct PassStructToCC2(SmallerStruct p, int a, SmallerStruct p2, int b, SmallerStruct p3, int c)
{
    printf("get int a -> %d , b -> %d , c -> %d\n", a, b, c);
    printf("get from CJ struct1: a -> %d\n", p.a);
    printf("get from CJ struct2: a -> %d\n", p2.a);
    printf("get from CJ struct3: a -> %d\n", p3.a);
    BiggerStruct bs;
    bs.x = 1;
    bs.y = 1;
    bs.z = 1;
    return bs;
}

SmallerStruct PassStructToCSS2(BiggerStruct p, int a, BiggerStruct p2, int b, BiggerStruct p3, int c)
{
    printf("get int a -> %d , b -> %d , c -> %d\n", a, b, c);
    printf("get from CJ struct1: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    printf("get from CJ struct2: x -> %lld , y -> %lld , z -> %lld\n", p2.x, p2.y, p2.z);
    printf("get from CJ struct3: x -> %lld , y -> %lld , z -> %lld\n", p3.x, p3.y, p3.z);
    SmallerStruct s;
    s.a = 1;
    return s;
}

BiggerStruct PassStructToC22(int a, BiggerStruct p, int b, BiggerStruct p2, int c, BiggerStruct p3)
{
    printf("get int a -> %d , b -> %d , c -> %d\n", a, b, c);
    printf("get from CJ struct1: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    printf("get from CJ struct2: x -> %lld , y -> %lld , z -> %lld\n", p2.x, p2.y, p2.z);
    printf("get from CJ struct3: x -> %lld , y -> %lld , z -> %lld\n", p3.x, p3.y, p3.z);
    return p;
}

BiggerStruct PassStructToC3(BiggerStruct p, BiggerStruct p2, BiggerStruct p3)
{
    printf("get from CJ struct1: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    printf("get from CJ struct2: x -> %lld , y -> %lld , z -> %lld\n", p2.x, p2.y, p2.z);
    printf("get from CJ struct3: x -> %lld , y -> %lld , z -> %lld\n", p3.x, p3.y, p3.z);
    return p;
}

void PassStructToC4(BiggerStruct p, BiggerStruct p2, BiggerStruct p3)
{
    printf("get from CJ struct1: x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    printf("get from CJ struct2: x -> %lld , y -> %lld , z -> %lld\n", p2.x, p2.y, p2.z);
    printf("get from CJ struct3: x -> %lld , y -> %lld , z -> %lld\n", p3.x, p3.y, p3.z);
}

BiggerStruct PassStructToCangjie()
{
    BiggerStruct p;
    p.x = 5;
    p.y = 6;
    p.z = 7;
    printf("pass struct to CJ : x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    return p;
}

BiggerStruct PassStructToCangjie2(int a)
{
    printf("get int %d\n", a);
    BiggerStruct p;
    p.x = 5;
    p.y = 6;
    p.z = 7;
    printf("pass struct to CJ : x -> %lld , y -> %lld , z -> %lld\n", p.x, p.y, p.z);
    return p;
}