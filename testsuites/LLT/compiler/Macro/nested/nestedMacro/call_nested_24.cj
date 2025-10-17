// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 888
// ASSERT: scan @M[1](999)

import pkg1.*
import std.ast.*

@M[1]
func A() {
    var a = quote($(@M[1](888)))
    println(a)
    0
}

@M[1]
func B() {
    var a = quote(@M[1](999))
    println(a)
    0
}

main(): Int64 {
    A()
    B()
    0
}
