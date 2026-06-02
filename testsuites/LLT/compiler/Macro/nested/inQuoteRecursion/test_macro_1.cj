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
    var a = quote(1 + @testa(2) + 1)
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
    if (a[6].value != ")") {
        return 7
    }
    if (a[7].value != "+") {
        return 8
    }
    if (a[8].value != "1") {
        return 9
    }
    0
}
