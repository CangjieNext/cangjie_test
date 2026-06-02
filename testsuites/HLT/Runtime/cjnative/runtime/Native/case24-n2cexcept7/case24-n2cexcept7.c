/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include "case24.h"

double C_Func1(double p)
{
    p = 11;
    double s = C2CJ_Func1(p);
    printf("get from C1 struct: s -> %f\n", s);
    return s;
}

double C_Func2(double p)
{
    p = 11;
    double s = C2CJ_Func2(p);
    printf("get from C2 struct: s -> %f\n", s);
    return s;
}