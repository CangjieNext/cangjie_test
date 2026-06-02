/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_50003.cj main_50003.cj
// EXEC: %compiler %cmp_macro macro_define_50003.cj
// EXEC: %run_macro %compiler  %f %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt main_50003.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_macro_opt %run_macro_opt %run_macro_opt %run_args

macro package test

import define_50003
import std.ast.*

public macro XX(a: Tokens) {
    var a1 = @define_50003.X(0)
    return quote($a1)
}

public macro YY(a: Tokens, b: Tokens) {
    var a1 = @define_50003.Y[1](0)
    return quote($a1)
}
