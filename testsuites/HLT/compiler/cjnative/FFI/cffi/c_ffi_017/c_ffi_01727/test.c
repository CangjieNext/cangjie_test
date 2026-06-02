/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdio.h>

struct S {
    bool a[3];
};

void test(struct S* s)
{
    (*s).a[0] = false;
}

// Pass an array
void cfoo1(bool* a)
{
    a[0] = false;
}
void cfoo2(bool a[4])
{
    a[1] = false;
}
void cfoo3(bool* a)
{
    a[2] = false;
}
void cfoo4(bool a[4])
{
    a[3] = false;
}

// return an array
bool ret[4] = {true, true, true, true};
bool* getArrayPtr()
{
    return ret;
}
