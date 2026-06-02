/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_macro %f
// EXEC: %run_macro %compiler %cmp_opt main.cj  -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

macro package define

import std.ast.*

enum A {
    a1(Bool) | a2(Int64)
}

enum B<T> {
    b1(T) | b2(T)
}

public macro M(attr: Tokens, input: Tokens): Tokens {
    var a = a1(true)
    var b = B<Int64>.b1(1)
    let res1 = match (a) {
        case a1(x) => 1
        case _ => 0
    }
    let res2 = match (b) {
        case b2(x) => 1
        case b1(y) => 2
        case _ => 0
    }
    if (res1 + res2 == 3) {
        return quote(0)
    }
    return quote(1)
}
