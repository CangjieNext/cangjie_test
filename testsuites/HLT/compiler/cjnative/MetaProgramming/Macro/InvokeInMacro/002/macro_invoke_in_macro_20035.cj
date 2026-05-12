/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20035.cj main_20035.cj
// EXEC: %compiler %cmp_macro define_20035.cj
// EXEC: %compiler %f  %cmp_macro
// EXEC: %compiler %cmp_opt  main_20035.cj -o %output


// RUN-EXEC: %run %run_opt %output %run_args

macro package use

import std.ast.*
import define_20035.*

public macro Y(attr: Tokens, input: Tokens): Tokens {
    UInt32(@X[r'1'](0))
    Rune(@X[1](0))
    Int64(@X[0.1](0))
    return quote(0)
}
