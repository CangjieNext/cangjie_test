/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.unicode.*

main() {
    var input: Tokens = quote(
        let (a,b) : (Int64, Int64)
    )
    let expr = parseDecl(input)
    if (expr is VarDecl) {
        var b = match (expr as VarDecl) {
            case Some(v) => v
            case None => throw Exception("Not VarDecl")
        }
        var modifierSize = b.modifiers.size
        var typeExpr = b.keyword.value
        var tp = b.pattern
        var tp0 = match (tp as TuplePattern) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not TuplePattern")
        }
        var tp0Expr = match (tp0 as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        var tp1 = match (tp as TuplePattern) {
            case Some(v) => v.patterns[1]
            case None => throw Exception("Not TuplePattern")
        }
        var tp1Expr = match (tp1 as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        if (modifierSize != 0 || typeExpr != "let" || tp0Expr != "a" || tp1Expr != "b") {
            return 1
        }
        return 0
    }
    return 1
}
