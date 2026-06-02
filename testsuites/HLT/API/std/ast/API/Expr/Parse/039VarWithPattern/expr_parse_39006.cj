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
        var _: B = a
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
        var dt = b.declType
        var dtExpr = match (dt as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var e = b.expr
        var eExpr = match (e as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (modifierSize != 0 || typeExpr != "var" || !(tp is WildcardPattern) || dtExpr != "B" || eExpr != "a") {
            return 1
        }
        return 0
    }
    return 1
}
