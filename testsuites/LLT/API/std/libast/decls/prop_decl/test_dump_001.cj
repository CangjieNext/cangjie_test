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
    public override func visit(curNode: FuncDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        public mut prop b: Int64 {
            get() {
                return a
            }
            set(value) {
                a = value
            }
        }
    )
    let propDecl = match (parseDecl(input) as PropDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    propDecl.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        return 1
    }
    propDecl.dump()
    return 0
}

// ASSERT: scan PropDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -modifiers: 1, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "mut"
// ASSERT: scan kind: MUT
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "prop"
// ASSERT: scan kind: PROP
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -getter: FuncDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "get"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -setter: FuncDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "set"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "value"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -paramType:     }
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "value"
// ASSERT: scan kind: IDENTIFIER
