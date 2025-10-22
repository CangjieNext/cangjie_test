/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint-gcc.h>

void nativeFunaa(void (*callbackaa)(int64_t, double, int64_t, double, int64_t, double, int64_t, double, int64_t, double,
                                    int64_t, double, int64_t, double, double, double))
{
    callbackaa(4, 8, 15, 16, 23, 42, 108, -4, -8, -15, -16, -23, -42, -108, -1, 3.14159265);
}
