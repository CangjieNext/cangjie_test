// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testMacro.cj test_macro_run1.cj test_macro_run1.cj.expect
// EXEC: %compiler testMacro.cj %cmp_macro
// EXEC: %compiler %cmp_macro %f
// EXEC: %run_macro %compiler %cmp_opt test_macro_run1.cj %macro_debug -o %output
// EXEC: %diff test_macro_run1.cj.macrocall test_macro_run1.cj.expect

macro package define_b

import define_a.*
import std.ast.*

public macro testb(input: Tokens) {
    @testAttr2[1] var attar = 1
    @testAttr2[1] var bttr = 1
    @testAttr2[1] var cttr = 1
    input
}
