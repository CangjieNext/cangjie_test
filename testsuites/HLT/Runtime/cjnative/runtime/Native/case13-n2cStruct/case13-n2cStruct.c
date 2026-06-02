/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include "case13.h"

BiggerStruct C_Func(BiggerStruct p)
{
    p.x = 11;
    p.y = 22;
    p.z = 33;
    BiggerStruct s = C2CJ_Func(p);
    printf("get from CJ struct: x -> %lld , y -> %lld , z -> %lld\n", s.x, s.y, s.z);
    return s;
}
