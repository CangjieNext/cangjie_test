/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30009.cj main_30009.cj
// EXEC: %compiler define_30009.cj %cmp_macro
// EXEC: %compiler %f %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt main_30009.cj -o %output | compare %f

// ASSERT: scan first is true
// ASSERT: scan second is false

macro package use

import std.ast.*

var flag = true

public macro Y(attr: Tokens, input: Tokens): Tokens {
    if (flag) {
        print("first is ${flag}\n")
        flag = !flag
        return quote(@Y[0](1))
    } else {
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}
// ASSERT: regex-not no position error occurred
