// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <iostream>

extern "C" {
int varB = 20;
typedef int* (*func)(int);
int* CFuncInCJ(func f, int b)
{
    f(b);
    return &varB;
}
}
