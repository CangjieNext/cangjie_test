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
        struct A {
            public prop b: Int64 {
                set(v) {
                    a = v
                }
            }
        }
    )
    let expr = parseDecl(input)
    if (expr is StructDecl) {
        var b = match (expr as StructDecl) {
            case Some(v) => v
            case None => throw Exception("Not StructDecl")
        }
        var bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        let propDeclOfClass = match (bodyExpr as PropDecl) {
            case Some(v) => v
            case None => throw Exception("Not PropDecl")
        }
        let modifierExpr = propDeclOfClass.modifiers[0]
        let modifierExprValue = match (modifierExpr as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        let identifierExpr = propDeclOfClass.identifier.value
        let typeExpr = propDeclOfClass.declType
        let typeExprValue = match (typeExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        let setterExpr = propDeclOfClass.setter.block
        let setterExprBlock = match (setterExpr as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        let setterExprBlock0 = match (setterExprBlock[0] as AssignExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not AssignExpr")
        }
        let setterExprBlock0Expr = match (setterExprBlock0 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (modifierExprValue != "public" || identifierExpr != "b" || typeExprValue != "Int64" ||
            setterExprBlock0Expr != "v") {
            return 5
        }
        return 0
    }
    return 1
}
