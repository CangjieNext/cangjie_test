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

main(): Int64 {
    var input: Tokens = quote(
        interface A {
            public prop b: Int64 {
                set(v) {
                    a = v
                }
            }
        }
    )
    let expr = parseDecl(input)
    if (expr is InterfaceDecl) {
        var b = match (expr as InterfaceDecl) {
            case Some(v) => v
            case None => throw Exception("Not InterfaceDecl")
        }
        var bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        let propDeclOfInterface = match (bodyExpr as PropDecl) {
            case Some(v) => v
            case None => throw Exception("Not PropDecl")
        }
        let setterExpr = propDeclOfInterface.setter.block
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
        if (setterExprBlock0Expr != "v") {
            return 10
        }

        return 0
    }
    return 1
}
