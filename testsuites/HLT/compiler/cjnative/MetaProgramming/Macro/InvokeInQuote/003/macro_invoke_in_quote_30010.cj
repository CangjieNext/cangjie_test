/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30010.cj main_30010.cj
// EXEC: %compiler define_30010.cj %macro_opt -o define_30010.%test_suffix
// ERRCHECK: %compiler %cmp_opt %f %macro_opt -o use.%test_suffix

macro package use

import std.ast.*
import define_30010.*

var flag = true

public macro Y(attr: Tokens, input: Tokens): Tokens {
    if (flag) {
        print("first is ${flag}\n")
        flag = !flag
        return quote($(@Y[0](1)))
    } else {
        print("second is ${flag}\n")
        return quote($(@B[0](1)))
    }
}
// ASSERT: scan macro_unexpect_def_and_call_in_same_pkg
