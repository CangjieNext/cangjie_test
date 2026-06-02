/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "stdio.h"
float PassToCFloat32_1(float in)
{
    if (in == 3.0) {
        return in;
    } else {
        return 100;
    }
}

float PassToCFloat32_3(float a, float b, float c)
{
    float ret = 100;
    if (a == 1 && b == 2 && c == 3) {
        return ret;
    }
    return 20;
}

float PassToCFloat32_7(float a, float b, float c, float d, float e, float f, float g)
{
    float ret = 100;
    if (a == 1 && b == 2 && c == 3 && d == 4 && e == 5 && f == 6 && g == 7) {
        return ret;
    }
    return 20;
}
