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
        open class A <: C & I {}
    )
    let expr = parseDecl(input)
    if (expr is ClassDecl) {
        var classDecl = match (expr as ClassDecl) {
            case Some(v) => v
            case None => throw Exception("Not ClassDecl")
        }
        var modifiersExpr = classDecl.modifiers[0]
        var modifiersExprValue = match (modifiersExpr as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        var keywordExpr = classDecl.keyword.value
        var identifierExpr = classDecl.identifier.value
        var supertypes0 = classDecl.superTypes[0]
        var supertypes0Expr = match (supertypes0 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var supertypes1 = classDecl.superTypes[1]
        var supertypes1Expr = match (supertypes1 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExRefTypepr")
        }
        var bodyExpr = classDecl.body
        var bodyExprSize = match (bodyExpr as Body) {
            case Some(v) => v.decls.size
            case None => throw Exception("Not Body")
        }
        if (modifiersExprValue != "open" || keywordExpr != "class" || identifierExpr != "A" || supertypes0Expr != "C" ||
            supertypes1Expr != "I" || bodyExprSize != 0) {
            return 6
        }

        return 0
    }
    return 1
}
