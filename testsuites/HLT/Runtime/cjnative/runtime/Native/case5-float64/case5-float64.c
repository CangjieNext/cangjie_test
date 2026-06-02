/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "stdio.h"
double PassToCFloat64_1(double in)
{
    if (in == 3.0) {
        return in;
    } else {
        return 100;
    }
}

double PassToCFloat64_3(double a, double b, double c)
{
    double ret = 100;
    if (a == 1 && b == 2 && c == 3) {
        return ret;
    }
    return 20;
}

double PassToCFloat64_7(double a, double b, double c, double d, double e, double f, double g)
{
    double ret = 100;
    if (a == 1 && b == 2 && c == 3 && d == 4 && e == 5 && f == 6 && g == 7) {
        return ret;
    }
    return 20;
}
