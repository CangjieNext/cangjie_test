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
    public override func visit(curNode: IfExpr) {
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        for (i in 0..attrSize-1) {
            var attrStr = attr[i].getOrThrow()
            var t = Tokens() + Token(TokenKind.IDENTIFIER, attrStr)
            if (attrStr.startsWith("Skip") || attrStr.startsWith("Bench") || attrStr.startsWith("TestCase")) {
                return Tokens()
            }
            t = t + Token(TokenKind.COMMA)
            tksInSquare = tksInSquare + t
        }
    )
    let expr = match (parseExpr(input) as ForInExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        println(myVisitor.ident.size)
        return 2
    }
    try {
        expr.patternGuard
        return 3
    } catch (e: Exception) {
        ()
    }

    expr.dump()
    return 0
}

// ASSERT: scan ForInExpr {
// ASSERT: scan -keywordF: Token {
// ASSERT: scan value: "for"
// ASSERT: scan kind: FOR
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "i"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "in"
// ASSERT: scan kind: IN
// ASSERT: scan -expr: RangeExpr {
// ASSERT: scan -start: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: ".."
// ASSERT: scan kind: RANGEOP
// ASSERT: scan -end: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrSize"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "-"
// ASSERT: scan kind: SUB
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: SubscriptExpr {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -indexList: 0, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "i"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "getOrThrow"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "t"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: BinaryExpr {
// ASSERT: scan -leftExpr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Tokens"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Token"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "TokenKind"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "IDENTIFIER"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 1, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 2, IfExpr {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "if"
// ASSERT: scan kind: IF
// ASSERT: scan -condition: BinaryExpr {
// ASSERT: scan -leftExpr: BinaryExpr {
// ASSERT: scan -leftExpr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "startsWith"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Skip"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "||"
// ASSERT: scan kind: OR
// ASSERT: scan -rightExpr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "startsWith"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Bench"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "||"
// ASSERT: scan kind: OR
// ASSERT: scan -rightExpr: CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrStr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "startsWith"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "TestCase"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -ifBlock: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Tokens"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 3, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "t"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "t"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Token"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "TokenKind"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "COMMA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 4, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "tksInSquare"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "tksInSquare"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "t"
// ASSERT: scan kind: IDENTIFIER
