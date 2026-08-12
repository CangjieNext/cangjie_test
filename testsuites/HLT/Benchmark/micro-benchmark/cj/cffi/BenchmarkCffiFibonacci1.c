/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>

int32_t Fibonacci1(int32_t* fib)
{
    int32_t i;
    fib[0] = 0;
    fib[1] = 1;

    for (i = 2; i < 100; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }
    return 0;
}
