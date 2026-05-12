/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30028.cj main_30028.cj
// EXEC: %compiler %cmp_opt define_30028.cj %macro_opt -o define_30028.%test_suffix
// ERRCHECK: %compiler %cmp_opt %f %macro_opt 


macro package use

import std.ast.*
import define_30028.*

var flag = 1
var count = 1

public macro X(attr: Tokens, input: Tokens): Tokens {
    if (flag != 0) {
        print("first is ${flag}\n")
        flag = flag - 1
        return quote(@X[0](1))
    } else {
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}

var x = quote($(@X[0](0)))

// ASSERT: scan macro_unexpect_def_and_call_in_same_pkg
// ASSERT: regex-not no position error occurred
