/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include "case14.h"

float C_Func(float p)
{
    p = 11;
    float s = C2CJ_Func(p);
    printf("get from CJ struct: s -> %f\n", s);
    return s;
}

float C_Func_7(float a, float b, float c, float d, float e, float f, float g)
{
    float s = C2CJ_Func_7(a, b, c, d, e, f, g);
    printf("get from CJ struct: s -> %f\n", s);
    return s;
}