/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30023.cj main_30023.cj
// EXEC: %compiler define_30023.cj %cmp_macro
// EXEC: %compiler %f %cmp_macro
// ERRCHECK: %run_macro %compiler %cmp_opt main_30023.cj -o %output

macro package use

import std.ast.*
import define_30023.*

var flag = 1
var count = 1

public macro X(attr: Tokens, input: Tokens): Tokens {
    if (flag != 0) {
        print("first is ${flag}\n")
        flag = flag - 1
        return quote(@X[0] {i:Int64=>i}) // lambda
    } else {
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}
// ASSERT: scan parse_expected_decl
