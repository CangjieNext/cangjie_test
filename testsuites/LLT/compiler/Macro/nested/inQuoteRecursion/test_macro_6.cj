// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroDefine.cj
// EXEC: %compiler %cmp_opt macroDefine.cj %cmp_macro
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*
import define_a.*

main(): Int64 {
    var a = quote(1 + \@testa(2 + @testa(2)) + 1)
    var b = quote(1 + @testaa(2 + @testaa(2)) + 1)
    var c = quote(1 + @testaaa(2 + @testaaa(2)) + 1)
    var d = quote(1 + @testAttr[1](2 + @testAttr[2](2)) + 1)
    var dd = quote(1 + @testAttr2[1](2 + @testAttr2[2](2)) + 1)
    var ddd = quote(1 + @testAttr[1](2 + @testAttr2[2](2)) + 1)
    var dddd = quote(1 + @testAttr2[1](2 + @testAttr[2](2)) + 1)
    var e = quote(1 + @testaQuote(2 + @testaQuote(2)) + 1)
    if (a[0].value != "1") {
        return 1
    }
    if (a[1].value != "+") {
        return 2
    }
    if (a[2].value != "@") {
        return 3
    }
    if (a[3].value != "testa") {
        return 4
    }
    if (a[4].value != "(") {
        return 5
    }
    if (a[5].value != "2") {
        return 6
    }
    0
}
