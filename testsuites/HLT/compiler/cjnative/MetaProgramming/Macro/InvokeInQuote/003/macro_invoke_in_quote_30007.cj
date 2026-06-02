/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30007.cj main_30007.cj
// EXEC: %compiler define_30007.cj %cmp_macro
// EXEC: %compiler %f %cmp_macro
// ERRCHECK:  %run_macro %compiler %cmp_opt main_30007.cj -o %output

macro package use

import std.ast.*
import define_30007.*

var flag = true

public macro Y(input: Tokens): Tokens {
    if (flag) {
        print("first is ${flag}\n")
        flag = !flag
        return quote(@Y @Y(1))
    } else {
        print("second is ${flag}\n")
        return quote(@A @A(1))
    }
}
// ASSERT: scan parse_expected_decl
