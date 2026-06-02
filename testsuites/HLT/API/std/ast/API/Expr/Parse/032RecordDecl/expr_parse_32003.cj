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

main(): Int64 {
    var input: Tokens = quote(
        public struct A <: C & I {}
    )
    let expr = parseDecl(input)
    if (expr is StructDecl) {
        var b = match (expr as StructDecl) {
            case Some(v) => v
            case None => throw Exception("Not StructDecl")
        }
        var modifierExpr = b.modifiers[0]
        var modifierExprValue = match (modifierExpr as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        var keywordExpr = b.keyword.value
        var identifierExpr = b.identifier.value
        var superTypeExpr = b.superTypes
        var superTypeExpr0 = match (superTypeExpr[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var superTypeExpr1 = match (superTypeExpr[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var bodyExpr = b.body
        var bodyExprSize = match (bodyExpr as Body) {
            case Some(v) => v.decls.size
            case None => throw Exception("Not Body")
        }
        if (modifierExprValue != "public" || keywordExpr != "struct" || identifierExpr != "A" || superTypeExpr0 != "C" ||
            superTypeExpr1 != "I" || bodyExprSize != 0) {
            return 2
        }
        return 0
    }
    return 1
}
