/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ParseASTException
// ASSERT: scan parsing expr error

import std.ast.*

main() {
    var input: Tokens = quote(a=b + c=d)
    let expr = parseExpr(input)
    if (expr is BinaryExpr) {
        var binaryExpr = match (expr as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }

        var lExpr = binaryExpr.leftExpr
        var rExpr = binaryExpr.rightExpr
        var optExpr = binaryExpr.op.value

        var llexpr = match (lExpr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not CallExpr")
        }

        var llval = match (llexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var lrexpr = match (lExpr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not CallExpr")
        }

        var lrval = match (lrexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var leq = match (lExpr as AssignExpr) {
            case Some(v) => v.assign.value
            case None => throw Exception("Not AssignExpr")
        }

        var rlexpr = match (rExpr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not CallExpr")
        }

        var rlval = match (rlexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var rrexpr = match (rExpr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not CallExpr")
        }

        var rrval = match (rrexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var req = match (rExpr as AssignExpr) {
            case Some(v) => v.assign.value
            case None => throw Exception("Not AssignExpr")
        }

        if (llval != "a" || lrval != "b" || rlval != "c" || rrval != "d" || optExpr != "+" || leq != "=" || req != "=") {
            return 1
        }
        return 0
    }
    return 3
}
