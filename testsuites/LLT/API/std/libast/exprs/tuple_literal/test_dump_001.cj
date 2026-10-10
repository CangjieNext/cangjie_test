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
        if (curNode.identifier.value == "emptyArray") {
            curNode.identifier = Token(TokenKind.IDENTIFIER, "element")
        }
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        (1, 2, 3, "emptyArray", 3, 2, 1)
    )
    let expr = match (parseExpr(input) as TupleLiteral) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.traverse(myVisitor)
    if (expr.elements.size != 7) {
        return 2
    }
    expr.elements[4] = LitConstExpr(quote(10))
    expr.dump()
    return 0
}

// ASSERT: scan TupleLiteral {
// ASSERT: scan -elements: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 1, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 2, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "3"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 3, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "emptyArray"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -elements: 4, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 5, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 6, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
