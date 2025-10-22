/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct A {
    int a;
};

struct S {
    struct A a[1][3];
};

void tests(struct S* s)
{
    ((*s).a[0][0]).a = 0;
}

// Pass an array
void cfoos1(struct A* a)
{
}
void cfoos2(struct A a[1][4])
{
    a[0][1].a = 0;
}
