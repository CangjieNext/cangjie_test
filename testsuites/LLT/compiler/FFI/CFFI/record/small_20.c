// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdbool.h>

typedef struct {
    bool b;
    bool bx;
} Data2B;

Data2B X_And(Data2B b0, Data2B b1, Data2B b2, Data2B b3, Data2B b4, Data2B b5, Data2B b6, Data2B b7, Data2B b8, Data2B b9, Data2B b10)
{
    Data2B b;
    b.b = b0.b && b1.b && b2.b && b3.b && b4.b && b5.b && b6.b && b7.b && b8.b && b9.b && b10.b;
    return b;
}

Data2B X_Or(Data2B b0, Data2B b1, Data2B b2, Data2B b3, Data2B b4, Data2B b5, Data2B b6, Data2B b7, Data2B b8, Data2B b9, Data2B b10)
{
    Data2B b;
    b.b = b0.b || b1.b || b2.b || b3.b || b4.b || b5.b || b6.b || b7.b || b8.b || b9.b || b10.b;
    return b;
}
