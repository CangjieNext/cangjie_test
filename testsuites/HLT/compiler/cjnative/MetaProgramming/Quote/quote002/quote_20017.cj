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
    quote(ab)
    quote(a_b)
    quote(a1)
    quote(ab_1)
    quote(`a`)
    quote(`a1`)
    quote(`a_`)
    quote(`ab_1`)
}
