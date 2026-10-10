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
        if(let Some(v) <- appHandler) {
            v.start()
        } else {
            logger.warn("AppCollection contains a WebHandler that not an AppHandler, this may be out of expected")
        }
    )
    let expr = match (parseExpr(input) as IfExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    var letPattern = (expr.condition as LetPatternExpr).getOrThrow()
    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 4) {
        return 2
    }
    expr.dump()
    return 0
}

// ASSERT: scan IfExpr {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "if"
// ASSERT: scan kind: IF
// ASSERT: scan -condition: LetPatternExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -pattern: EnumPattern {
// ASSERT: scan -constructor: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Some"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "v"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -backArrow: Token {
// ASSERT: scan value: "<-"
// ASSERT: scan kind: BACKARROW
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "appHandler"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -ifBlock: Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "v"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "start"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -keywordE: Token {
// ASSERT: scan value: "else"
// ASSERT: scan kind: ELSE
// ASSERT: scan -elseExpr: Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "logger"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "warn"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "AppCollection contains a WebHandler that not an AppHandler, this may be out of expected"
// ASSERT: scan kind: STRING_LITERAL
