// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj call.cj
// EXEC: %compiler %cmp_opt define.cj %cmp_macro
// EXEC: %compiler %cmp_opt %f %cmp_macro
// EXEC: %compiler %cmp_opt call.cj %macro_parallel -o %output
// EXEC: %run %run_opt %run_args %output

macro package use

import std.ast.*

var flag = true

public macro Y(input: Tokens): Tokens {
    if (flag) {
        print("first is ${flag}\n")
        flag = !flag
        return quote(@Y(1))
    } else {
        print("second is ${flag}\n")
        return quote(@A(1))
    }
}
// ASSERT: regex-not no position error occurred
