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


internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        do {
            read = clientSocket.read(buf)
            readLen += read
        } while (read != 0)
    )
    let expr = match (parseExpr(input) as DoWhileExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 6) {
        return 2
    }

    expr.dump()
    return 0
}

// ASSERT: scan DoWhileExpr {
// ASSERT: scan -keywordD: Token {
// ASSERT: scan value: "do"
// ASSERT: scan kind: DO
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "read"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "clientSocket"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "read"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "buf"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "readLen"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "+="
// ASSERT: scan kind: ADD_ASSIGN
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "read"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -keywordW: Token {
// ASSERT: scan value: "while"
// ASSERT: scan kind: WHILE
// ASSERT: scan -condition: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "read"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "!="
// ASSERT: scan kind: NOTEQ
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
