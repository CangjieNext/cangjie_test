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
    quote(-0xF)
    quote(-0Xf)
    quote(0x1)
    quote(-0xa_)
    quote(-0xb_c)
    quote(-0x0__1)
    quote(-0x5678)
    quote(-0xd_e_f_9_)
    quote(+0x123)
    quote(--0x0)
}
