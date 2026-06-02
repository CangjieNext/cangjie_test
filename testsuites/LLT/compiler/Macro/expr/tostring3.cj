// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan var text = r'\\''
// ASSERT: scan var text = r'a'
internal import std.ast.*

func test() {
    var char: String = #"var text = r'a'"#
    var tks = cangjieLex(char)
    println("${tks.toString()}")
}

main() {
    var char: String = #"var text = r'\''"#
    var tks = cangjieLex(char)
    var decl = parseDecl(tks)
    println(decl.toTokens())
    test()
}
