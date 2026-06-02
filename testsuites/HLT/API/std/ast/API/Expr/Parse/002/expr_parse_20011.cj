/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(if (true){}+if (false){})
    let expr = parseExpr(input)
    if (expr is BinaryExpr) {
        var binaryExpr = match (expr as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }

        var lExpr = binaryExpr.leftExpr
        var rExpr = binaryExpr.rightExpr
        var optExpr = binaryExpr.op.value

        var lkey = match (lExpr as IfExpr) {
            case Some(v) => v.keywordI.value
            case None => throw Exception("Not IfExpr")
        }

        var llparen = match (lExpr as IfExpr) {
            case Some(v) => v.lParen.value
            case None => throw Exception("Not IfExpr")
        }
        var lconExpr = match (lExpr as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }
        var lconVal = match (lconExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var lrparen = match (lExpr as IfExpr) {
            case Some(v) => v.rParen.value
            case None => throw Exception("Not IfExpr")
        }

        var rkey = match (rExpr as IfExpr) {
            case Some(v) => v.keywordI.value
            case None => throw Exception("Not IfExpr")
        }

        var rlparen = match (rExpr as IfExpr) {
            case Some(v) => v.lParen.value
            case None => throw Exception("Not IfExpr")
        }
        var rconExpr = match (rExpr as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }
        var rconVal = match (rconExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var rrparen = match (rExpr as IfExpr) {
            case Some(v) => v.rParen.value
            case None => throw Exception("Not IfExpr")
        }

        if (lkey != "if" || llparen != "(" || lconVal != "true" || lrparen != ")" || optExpr != "+") {
            return 1
        }

        if (rkey != "if" || rlparen != "(" || rconVal != "false" || rrparen != ")") {
            return 2
        }
        return 0
    }
    return 3
}
