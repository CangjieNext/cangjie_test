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
         type A = (??Int64)
    )
    let expr = parseDecl(input)
    if (expr is TypeAliasDecl) {
        var tp = match (expr as TypeAliasDecl) {
            case Some(v) => v.aliasType
            case None => throw Exception("Not TypeAliasDecl")
        }

        if (!(tp is ParenType)) {
            return 2
        }

        var ptExpr = match (tp as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var poExpr = match (ptExpr as PrefixType) {
            case Some(v) => v.prefixOps
            case None => throw Exception("Not PrefixType")
        }

        if (poExpr.size != Int64(2)) {
            return 3
        }
        return 0
    }
    return 1
}
