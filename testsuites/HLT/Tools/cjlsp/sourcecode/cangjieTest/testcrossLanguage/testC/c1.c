/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint-gcc.h>

static int8_t testfuncstatic(int8_t a, int8_t b);

int main()
{
    testfuncstatic(0, 0);
    return 0;
}

static int8_t testfuncstatic(int8_t a, int8_t b)
{
    int8_t c = a + b;
    return c;
}
