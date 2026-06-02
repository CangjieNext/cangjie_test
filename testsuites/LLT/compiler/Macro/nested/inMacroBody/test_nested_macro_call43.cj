// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testMacro.cj test_macro_run3.cj
// EXEC: %compiler testMacro.cj %cmp_macro
// EXEC: %compiler %cmp_macro %f
// EXEC: %run_macro %compiler %cmp_opt test_macro_run3.cj  -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex 12

macro package define_b

import define_a.*
import std.ast.*

public macro testb(input: Tokens) {
    @testaQuote var a = 1
}
