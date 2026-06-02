// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    var input = quote(
        f(1) { i => i * i }
    )
    var expr = match (parseExpr(input) as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    var flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    input = quote(
        f{ i => i * i }
    )
    expr = match (parseExpr(input) as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 2
    }
    input = quote(
        f{ i * i }
    )
    expr = match (parseExpr(input) as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 3
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
