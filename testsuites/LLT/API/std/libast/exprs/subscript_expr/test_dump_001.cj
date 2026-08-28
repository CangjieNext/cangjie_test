/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

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
    let input = quote(
        arr[..4][1..4:2]
    )
    let expr = match (parseExpr(input) as SubscriptExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.dump()
    return 0
}

// ASSERT: scan SubscriptExpr {
// ASSERT: scan -baseExpr: SubscriptExpr {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -indexList: 0, RangeExpr {
// ASSERT: scan -op: Token {
// ASSERT: scan value: ".."
// ASSERT: scan kind: RANGEOP
// ASSERT: scan -end: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "4"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -indexList: 0, RangeExpr {
// ASSERT: scan -start: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: ".."
// ASSERT: scan kind: RANGEOP
// ASSERT: scan -end: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "4"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -step: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
