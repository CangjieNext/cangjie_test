// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../expr_macro.cj
// EXEC: %compiler %cmp_macro expr_macro.cj
// EERCHECK: %run_macro %compiler %cmp_opt %f -o %output

// ASSERT:scan unexpected _ wildcard
// ASSERT:scan cannot '+=' a tuple

internal import std.ast.*

main(): Unit {
    var a = 1
    var b = 1
    let tokens = quote((a, b) += (_, 3))
    let expr = parseExpr(tokens)
}
