// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdio.h>

struct Empty {};

struct Big {
    int64_t a;
    int64_t b;
    int64_t c;
};

typedef struct Big (*foo_func_t)(int8_t p1, struct Empty e1, uint16_t p2, struct Empty e2);

void testFoo(foo_func_t foo) {
    struct Empty e1, e2;

    printf("calling foo from C...\n");

    foo(100, e1, 200, e2);

    return;
}
