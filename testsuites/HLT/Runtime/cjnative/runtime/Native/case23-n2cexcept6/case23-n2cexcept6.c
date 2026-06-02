/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include "case23.h"

double Func(double p)
{
    p = 11;
    double s = C2CJ_Func(p);
    printf("get from CJ struct: s -> %f\n", s);
    return s;
}

double C_Func(double p)
{
    p = 11;
    double s = Func(p);
    printf("get from C struct: s -> %f\n", s);
    return s;
}