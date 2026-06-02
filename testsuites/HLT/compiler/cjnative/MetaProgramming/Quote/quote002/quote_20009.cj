/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_macro %f

macro package define

import std.ast.*

public macro test(input: Tokens): Tokens {
    quote(-0)
    quote(0)
    quote(123456789)
    quote(4_)
    quote(3_2)
    quote(1__1)
    quote(3456)
    quote(1_2_3_4_)
    quote(+0)
    quote(--0)
}
