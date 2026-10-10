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
    var num = 0
    public override func visit(curNode: ExceptTypePattern) {
        num++
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        try{
            var a = 1
        } catch(e: Exception) {
            throw Exception()
        }
    )
    let te = (parseExpr(input) as TryExpr).getOrThrow()
    let flag = compareTokens(input, te.toTokens())
    if (!flag) {
        return 1
    }
    te.traverse(myVisitor)
    if (myVisitor.num != 1) {
        return 2
    }
    te.dump()
    return 0
}

// ASSERT: scan TryExpr {
// ASSERT: scan -keywordT: Token {
// ASSERT: scan value: "try"
// ASSERT: scan kind: TRY
// ASSERT: scan -tryBlock: Block {
// ASSERT: scan -nodes: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -keywordsC: 0, Token {
// ASSERT: scan value: "catch"
// ASSERT: scan kind: CATCH
// ASSERT: scan -catchPatterns: 0, ExceptTypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -types: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Exception"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -catchBlocks: 0, Block {
// ASSERT: scan -nodes: 0, ThrowExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "throw"
// ASSERT: scan kind: THROW
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Exception"
// ASSERT: scan kind: IDENTIFIER
