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
    }
}

let opTokens = quote(c?.a?(b))
let opExpr3 = parseExpr(opTokens)
let myVisitor = MyVisitor()

main(): Int64 {
    var flag = opExpr3 is CallExpr
    if (!flag) {
        return 1
    }
    let expr = (opExpr3 as CallExpr).getOrThrow()
    let call = (expr.callFunc as OptionalExpr).getOrThrow()
    if (!(call.baseExpr is MemberAccess)) {
        return 2
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        return 3
    }
    opExpr3.dump()

    return 0
}

// ASSERT: scan CallExpr {
// ASSERT: scan -callFunc: OptionalExpr {
// ASSERT: scan -baseExpr: MemberAccess {
// ASSERT: scan -baseExpr: OptionalExpr {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "c"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -quest: Token {
// ASSERT: scan value: "?"
// ASSERT: scan kind: QUEST
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -quest: Token {
// ASSERT: scan value: "?"
// ASSERT: scan kind: QUEST
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
