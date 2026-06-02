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
    var input: Tokens = quote(a.b+c.d)
    let expr = parseExpr(input)
    if (expr is BinaryExpr) {
        var binaryExpr = match (expr as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }

        var lExpr = binaryExpr.leftExpr
        var rExpr = binaryExpr.rightExpr
        var optExpr = binaryExpr.op.value

        var lclassExpr = match (lExpr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }

        var lclass = match (lclassExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var ldot = match (lExpr as MemberAccess) {
            case Some(v) => v.dot.value
            case None => throw Exception("Not MemberAccess")
        }

        var lfield = match (lExpr as MemberAccess) {
            case Some(v) => v.field.value
            case None => throw Exception("Not MemberAccess")
        }

        var rclassExpr = match (rExpr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }

        var rclass = match (rclassExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var rdot = match (rExpr as MemberAccess) {
            case Some(v) => v.dot.value
            case None => throw Exception("Not MemberAccess")
        }

        var rfield = match (rExpr as MemberAccess) {
            case Some(v) => v.field.value
            case None => throw Exception("Not MemberAccess")
        }

        if (optExpr != "+" || lclass != "a" || ldot != "." || lfield != "b" || rclass != "c" || rdot != "." || rfield !=
            "d") {
            return 1
        }
        return 0
    }
    return 3
}
