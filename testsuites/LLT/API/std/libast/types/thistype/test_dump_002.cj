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
    public override func visit(curNode: PrimitiveType) {
        ident.add(curNode.keyword.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        class Test {
            func self() : This { this }
            func selfArray() { arrayify(self) }
        }
    )
    let ty = (parseDecl(input) as ClassDecl).getOrThrow()
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.dump()
    return 0
}

// ASSERT: scan ClassDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "class"
// ASSERT: scan kind: CLASS
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Test"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan -decls: 0, FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "self"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: ThisType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "This"
// ASSERT: scan kind: THISTYPE
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "this"
// ASSERT: scan kind: THIS
// ASSERT: scan -decls: 1, FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "selfArray"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arrayify"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "self"
// ASSERT: scan kind: IDENTIFIER
