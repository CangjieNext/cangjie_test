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
        interface A {
            open override mut prop b: Int64
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
        let modifierExpr = propDeclOfInterface.modifiers
        let modifierExpr0 = match (modifierExpr[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        let modifierExpr1 = match (modifierExpr[1] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        let modifierExpr2 = match (modifierExpr[2] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (modifierExpr0 != "open" || modifierExpr1 != "override" || modifierExpr2 != "mut") {
            return 5
        }
        return 0
    }
    return 1
}
