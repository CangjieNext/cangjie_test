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
        interface A {}
    )
    let expr = parseDecl(input)
    if (expr is InterfaceDecl) {
        var b = match (expr as InterfaceDecl) {
            case Some(v) => v
            case None => throw Exception("Not InterfaceDecl")
        }
        var modifierExpr = b.modifiers.size
        var keywordExpr = b.keyword.value
        var identifierExpr = b.identifier.value
        var superTypeExpr = b.superTypes.size
        var bodyExprSize = match (b.body as Body) {
            case Some(v) => v.decls.size
            case None => throw Exception("Not Body")
        }
        if (modifierExpr != 0 || keywordExpr != "interface" || identifierExpr != "A" || superTypeExpr != 0 ||
            bodyExprSize != 0) {
            return 2
        }
        return 0
    }
    return 1
}
