// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <stdio.h>

extern double C2CJ_Func(double p);

double C_Func(double p)
{
    p = 11;
    double s = C2CJ_Func(p);
    printf("get from CJ record: s -> %f\n", s);
    return s;
}
