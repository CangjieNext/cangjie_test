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

main() {
    var input: Tokens = quote(
         throw A.b<T>
    )
    let expr = parseExpr(input)
    if (expr is ThrowExpr) {
        var throwExpr = match (expr as ThrowExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ThrowExpr")
        }
        var throwExprMember = match (throwExpr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var throwExprMemberbase = throwExprMember.baseExpr
        var throwExprMembertype = throwExprMember.typeArguments[0]
        var throwExprMemberbaseValue = match (throwExprMemberbase as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var throwExprMembertypeExpr = match (throwExprMembertype as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (throwExprMemberbaseValue != "A" || throwExprMembertypeExpr != "T") {
            return 1
        }
        return 0
    }
    return 1
}
