// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdbool.h>

typedef struct {
    bool b;
} Data1B;

Data1B X_And(Data1B b0, Data1B b1, Data1B b2, Data1B b3, Data1B b4, Data1B b5, Data1B b6, Data1B b7, Data1B b8, Data1B b9, Data1B b10)
{
    Data1B b;
    b.b = b0.b && b1.b && b2.b && b3.b && b4.b && b5.b && b6.b && b7.b && b8.b && b9.b && b10.b;
    return b;
}

Data1B X_Or(Data1B b0, Data1B b1, Data1B b2, Data1B b3, Data1B b4, Data1B b5, Data1B b6, Data1B b7, Data1B b8, Data1B b9, Data1B b10)
{
    Data1B b;
    b.b = b0.b || b1.b || b2.b || b3.b || b4.b || b5.b || b6.b || b7.b || b8.b || b9.b || b10.b;
    return b;
}
