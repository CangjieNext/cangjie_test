/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output

import std.ast.*

main(): Int64 {
    var cnt = 0
    let input1 = quote(
        var a: Int64 = 10
    )
    let input2 = quote(
        var (a, b) = (7, 20)
    )
    let input3 = quote(
        var (a, b): (Int64, Int64)
    )
    var varDecl = match (parseDecl(input1) as VarDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    try {
        varDecl.pattern
    } catch (e: ASTException) {
        if (e.message == "'VarDecl' has no pattern.") {
            cnt++
        }
    }

    varDecl = match (parseDecl(input2) as VarDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    try {
        varDecl.declType
    } catch (e: ASTException) {
        if (e.message == "'VarDecl' has no explicit type.") {
            cnt++
        }
    }

    varDecl = match (parseDecl(input3) as VarDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    try {
        varDecl.expr
    } catch (e: ASTException) {
        if (e.message == "'VarDecl' is not initialized.") {
            cnt++
        }
    }

    if (cnt != 3) {
        return 1
    }
    return 0
}