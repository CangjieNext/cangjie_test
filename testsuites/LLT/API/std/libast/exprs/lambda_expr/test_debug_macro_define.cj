/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

public macro M(input: Tokens): Tokens {
    let x = quote(
        { x: Int64 => let y = { z: Int64 => var i = 1+ 1
                var k = z + i; k }}
    )
    let y = (parseExpr(x) as LambdaExpr).getOrThrow()
    return y.toTokens()
}