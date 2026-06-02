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
    quote(-0o7)
    quote(-0O6)
    quote(0o5)
    quote(-0o4_)
    quote(-0o3_2)
    quote(-0o1__1)
    quote(-0o3456)
    quote(-0o1_2_3_4_)
    quote(+0o123)
    quote(--0o0)
}
