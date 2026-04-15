// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testMacro.cj test_macro_run2.cj %f.expect
// EXEC: %compiler testMacro.cj %cmp_macro
// EXEC: %compiler %cmp_macro %f
// EXEC: %run_macro %compiler %cmp_opt test_macro_run2.cj %macro_debug -o %output
// EXEC: %diff test_macro_run2.cj.macrocall %f.expect

macro package define_b

import define_a.*
import std.ast.*

public macro testb(attr: Tokens) {
    @testa( if (true) { quote(0)} else { return quote(0)})
}

public macro testbb(attr: Tokens, input: Tokens) {
    @testa( if (true) { quote(0)} else { return quote(0)})
}
