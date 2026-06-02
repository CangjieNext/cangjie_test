// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test_macro_quote2.cj
// EXEC: %compiler %cmp_macro test_macro_quote2.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 10
// ASSERT: scan 21
// ASSERT: scan 3

import view.*

main(): Int64 {
    var a = @callView(1 + 2)
    var b = @test(1 + 2)
    var c = @test2(1 + 2)
    println(a)
    println(b)
    println(c)
    return 0
}
