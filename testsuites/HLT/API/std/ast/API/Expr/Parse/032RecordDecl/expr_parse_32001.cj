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
        struct A {}
    )
    let expr = parseDecl(input)
    if (expr is StructDecl) {
        var b = match (expr as StructDecl) {
            case Some(v) => v
            case None => throw Exception("Not StructDecl")
        }
        var modifiedExpr = b.modifiers.size
        var keywordExpr = b.keyword.value
        var identifierExpr = b.identifier.value
        var superTypeExpr = b.superTypes.size
        var bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls.size
            case None => throw Exception("Not Body")
        }
        if (modifiedExpr != 0 || keywordExpr != "struct" || identifierExpr != "A" || superTypeExpr != 0 || bodyExpr != 0) {
            return 2
        }
        return 0
    }
    return 1
}
