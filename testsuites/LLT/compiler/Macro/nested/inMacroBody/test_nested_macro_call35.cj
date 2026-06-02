// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testMacro.cj test_macro_run1.cj
// EXEC: %compiler testMacro.cj %cmp_macro
// ERRCHECK: %compiler %cmp_opt %f
// ASSERT: scan unexpected interface declaration in macro body
// ASSERT: scan unexpected variable declaration in interface body


macro package define_b

import define_a.*
internal import std.ast.*

public macro testb(input: Tokens){
    @testa
    interface iName{
        let b: Int64 = 0
    }
    input
}
