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
    quote(-0b0)
    quote(-0B1)
    quote(0b1)
    quote(-0b0_)
    quote(-0b0_1)
    quote(-0b0__1)
    quote(-0b0110)
    quote(-0b0_1_1_0_)
    quote(+0b000)
    quote(--0b0)
}
