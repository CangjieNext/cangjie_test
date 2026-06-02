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
        for (i in A.a<T> where A.b<V>){
            A.c<U>
        }
    )
    let expr = parseExpr(input)
    if (expr is ForInExpr) {
        var forExpr = match (expr as ForInExpr) {
            case Some(v) => v
            case None => throw Exception("Not ForInExpr")
        }
        var pattrenExpr = forExpr.pattern
        var InExpr = forExpr.expr
        var body = forExpr.block
        var patternGuard = forExpr.patternGuard
        var pattrenExprValue = match (pattrenExpr as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        var InExprMember = match (InExpr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }
        var InExprMemberValue = match (InExprMember as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardMember = match (patternGuard as MemberAccess) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not MemberAccess")
        }
        var patternGuardMemberValue = match (patternGuardMember as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var bodyMember = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyMemberExpr = match (bodyMember as MemberAccess) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not MemberAccess")
        }
        var bodyMemberExprValue = match (bodyMemberExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (pattrenExprValue != "i" || InExprMemberValue != "A" || patternGuardMemberValue != "V" ||
            bodyMemberExprValue != "U") {
            return 1
        }
        return 0
    }
    return 1
}
