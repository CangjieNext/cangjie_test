// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdio.h>

struct A {
    int64_t n;
    void (*f)(struct A a);
};

void af(struct A a)
{
    printf("In C: af(), a.n = %ld\n", a.n);
}

struct A GetA()
{
    struct A a = {1, af};
    return a;
}
