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

extern BiggerStruct C2CJ_Func(BiggerStruct p);

BiggerStruct C_Func(BiggerStruct p)
{
    p.x = 11;
    p.y = 22;
    p.z = 33;
    BiggerStruct s = C2CJ_Func(p);
    printf("get from CJ struct: x -> %lld , y -> %lld , z -> %lld\n", s.x, s.y, s.z);
    return s;
}


// #include <stdio.h>

// extern int C2CJ_Func(int p);

// int C_Func(int p)
// {
//     p = 11;
//     int s = C2CJ_Func(p);
//     printf("get from CJ struct: s -> %d\n", s);
//     return s;
// }