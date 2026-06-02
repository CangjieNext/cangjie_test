// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan var text = "123"

internal import std.ast.*

main() {
    var str: String = #"var text = "123""#
    var tks = cangjieLex(str)
    var decl = parseDecl(tks)
    println(decl.toTokens())
}
