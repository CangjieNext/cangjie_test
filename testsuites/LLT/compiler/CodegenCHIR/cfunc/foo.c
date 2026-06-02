// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <stdint.h>
#include <stdio.h>

struct A {
    int8_t a;
};
struct A foo3(struct A a)
{
    printf("foo3: A.a = %d\n", a.a);
    return a;
}
