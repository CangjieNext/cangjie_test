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
         throw obj(a)
    )
    let expr = parseExpr(input)
    if (expr is ThrowExpr) {
        var throwExpr = match (expr as ThrowExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ThrowExpr")
        }
        var throwExprCall = match (throwExpr as CallExpr) {
            case Some(v) => v
            case None => throw Exception("Not CallExpr")
        }
        var throwExprCallfunc = throwExprCall.callFunc
        var throwExprarguments = throwExprCall.arguments[0]
        var throwExprCallfuncValue = match (throwExprCallfunc as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var throwExprargumentsExpr = match (throwExprarguments as Argument) {
            case Some(v) => v.expr
            case None => throw Exception("Not Argument")
        }
        var throwExprargumentsExprValue = match (throwExprargumentsExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (throwExprCallfuncValue != "obj" || throwExprargumentsExprValue != "a") {
            return 1
        }
        return 0
    }
    return 1
}
