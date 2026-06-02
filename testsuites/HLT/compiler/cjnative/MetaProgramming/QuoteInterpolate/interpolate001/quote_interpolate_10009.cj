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
// EXEC-PIPE: %run_macro %compiler %cmp_opt  main.cj -o %output | compare %f
// ASSERT: scan integer_literal
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

macro package define

import std.ast.*

let a = 1

public macro test(input: Tokens): Tokens {
    var x = quote(
    $(
    a
   )
   )
    var y = quote(
    $(
    a
   )
   )
    x.dump()
    y.dump()
    return quote(0)
}
// ASSERT: regex-not no position error occurred
