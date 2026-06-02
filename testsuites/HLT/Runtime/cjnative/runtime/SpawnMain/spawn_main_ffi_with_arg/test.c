/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "stdio.h"

double CangjieFunc1(int a0, double a1, int a2, double a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10,
                    int a11);
double CangjieFunc2(int a0, double a1, int a2, double a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10,
                    int a11);

double CTest(int a0, double a1, int a2, double a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, int a11)
{
    return CangjieFunc1(a0 + 1, a1 + 2, a2 + 3, a3 + 4, a4 + 5, a5 + 6, a6 + 7, a7 + 8, a8 + 9, a9 + 10, a10 + 11,
                        a11 + 12);
}

double CTest1(int a0, double a1, int a2, double a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, int a11)
{
    return CangjieFunc2(a0 + 1, a1 + 2, a2 + 3, a3 + 4, a4 + 5, a5 + 6, a6 + 7, a7 + 8, a8 + 9, a9 + 10, a10 + 11,
                        a11 + 12);
}