/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30015.cj main_30015.cj
// EXEC: %compiler define_30015.cj %cmp_macro
// EXEC: %compiler %f %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt main_30015.cj -o %output

// RUN-EXEC: %run %run_opt %output
// ASSERT: scan count is 11

macro package use

import std.ast.*

var flag = 5
var count = 1

public macro X(input: Tokens): Tokens {
    print("count is ${count}\n")
    print("flag is ${flag}\n")
    count = count + 1
    if (flag != 0) {
        flag = flag - 1
        return quote(@X@X(1))
    } else {
        input.dump()
        return quote(@B[0](1))
    }
}
