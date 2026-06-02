// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testMacro.cj test_macro_run1.cj
// EXEC: %compiler testMacro.cj %cmp_macro
// ERRCHECK: %compiler %cmp_opt %f
// ASSERT: scan macro's call and definition can not in one package

macro package define_b

import define_a.*
internal import std.ast.*

public macro testb(input: Tokens) {
    @testbb[1 + ](2)
    input
}

public macro testbb(attr: Tokens, input: Tokens) {
    input
}
