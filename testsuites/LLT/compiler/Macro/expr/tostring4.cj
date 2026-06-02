// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f

internal import std.ast.*

main() {
    var strInitStmt: String = #"var text = b"123""#
    var stmtTokens: Tokens = cangjieLex(strInitStmt)
    println("${stmtTokens.toString()}")
}

/* SCAN
var text = b "123"
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

