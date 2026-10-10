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
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        func test() {
            let a = 10
            var count =  0
            var res = ""
            let arr1 = [1,2,3,4,5]
            let arr2 = [a,a,a,10]
            if (a < 10) {
                a = a + 1
            }
       }
    )
    let fd = match (parseDecl(input) as FuncDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    var block = fd.block

    var b = VarDecl(quote(var b = 2))
    block.nodes.add(b, at: 1)
    block.traverse(myVisitor)
    if (myVisitor.ident.size != 6) {
        return 2
    }
    block.dump()

    return 0
}

// ASSERT: scan Block {
// ASSERT: scan -nodes: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 1, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 2, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 3, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: ""
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -nodes: 4, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arr1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: ArrayLiteral {
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
// ASSERT: scan value: "4"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 4, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "5"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 5, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arr2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: ArrayLiteral {
// ASSERT: scan -elements: 0, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -elements: 1, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -elements: 2, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -elements: 3, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 6, IfExpr {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "if"
// ASSERT: scan kind: IF
// ASSERT: scan -condition: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "<"
// ASSERT: scan kind: LT
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -ifBlock: Block {
// ASSERT: scan -nodes: 0, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
