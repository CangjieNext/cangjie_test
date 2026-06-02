// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdio.h>

typedef int64_t (*CFunc)(int64_t, int64_t);

typedef struct {
    CFunc f;
} CStruct;

int64_t func(int64_t a, int64_t b)
{
    return a + b + 10;
}

CStruct foo(CStruct cs)
{
    printf("%d\n", cs.f(1, 2));
    cs.f = func;
    return cs;
}
