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
         match {
            case a>b => 1
            case _ => var a = b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var hasSelector = true
        try {
            mh.selector
        } catch (e: ASTException) {
            hasSelector = false
        }

        var matches = mh.matchCases[1]
        var matchesExpr = match (matches as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        matchesExpr.toTokens().dump()
        var mp = match (matches as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        mp.dump()
        var mpExpr = match (mp as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mpDecl = match (mpExpr as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var mpkey = match (mpDecl as VarDecl) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not VarDecl")
        }
        var mpValue = match (mpDecl as VarDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarDecl")
        }
        var mpassign = match (mpDecl as VarDecl) {
            case Some(v) => v.assign.value
            case None => throw Exception("Not VarDecl")
        }
        var mpInitially = match (mpDecl as VarDecl) {
            case Some(v) => v.expr
            case None => throw Exception("Not VarDecl")
        }
        var mpInitiallyValue = match (mpInitially as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (hasSelector != false || !(mpExpr is Decl) || mpkey != "var" || mpValue != "a" || mpassign != "=" ||
            mpInitiallyValue != "b") {
            return 1
        }
        return 0
    }
    return 1
}
