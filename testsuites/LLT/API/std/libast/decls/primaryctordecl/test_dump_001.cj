/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.expect
// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: ClassDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        @When[os == "Linux"]
        @C
        private const Rectangle(let width: Int64, let height: Int64) {
            this.width = 10
            this.height = 10
        }
    )
    let primaryCtor = match (parseDecl(input, astKind: "PrimaryCtorDecl") as PrimaryCtorDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    primaryCtor.traverse(myVisitor)

    // test annotations
    let annotations = primaryCtor.annotations
    if (annotations.size != 2) {
        return 1
    }
    if (annotations[0].identifier.value != "When") {
        return 2
    }
    if (!compareTokens(annotations[0].condition.toTokens(), quote(os == "Linux"))) {
        return 3
    }
    if (annotations[1].identifier.value != "C") {
        return 4
    }

    // test modifiers
    let modifiers = primaryCtor.modifiers
    if (modifiers.size != 2) {
        return 5
    }
    if (modifiers[0].keyword.value != "private" || modifiers[1].keyword.value != "const") {
        return 6
    }

    let output = quote($primaryCtor)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 7
    }

    if (myVisitor.ident.size != 0) {
        return 8
    }
    let params = primaryCtor.funcParams
    if (params.size != 2) {
        return 9
    }
    primaryCtor.dump()

    return 0
}

// ASSERT: scan PrimaryCtorDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: When
// ASSERT: scan -condition: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "os"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "=="
// ASSERT: scan kind: EQUAL
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Linux"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: C
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "private"
// ASSERT: scan kind: PRIVATE
// ASSERT: scan -modifiers: 1, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "const"
// ASSERT: scan kind: CONST
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Rectangle"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "width"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -funcParams: 1, FuncParam {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "height"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, AssignExpr {
// ASSERT: scan -leftExpr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "this"
// ASSERT: scan kind: THIS
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "width"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 1, AssignExpr {
// ASSERT: scan -leftExpr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "this"
// ASSERT: scan kind: THIS
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "height"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
