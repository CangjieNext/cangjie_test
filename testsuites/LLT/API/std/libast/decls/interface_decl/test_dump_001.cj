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
    public override func visit(curNode: InterfaceDecl) {
        ident.add(curNode.identifier.value)
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        public interface A <: T1 & T2 & T3 {
            func foo(res: String, count: int64) {
                var a = res
            }
       }
    )
    let interfaceDecl = match (parseDecl(input) as InterfaceDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    interfaceDecl.traverse(myVisitor)
    let modifiers = interfaceDecl.modifiers
    if (modifiers.size != 1) {
        return 1
    }
    if (modifiers[0].keyword.value != "public") {
        return 2
    }

    let output = quote($interfaceDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
    }
    if (myVisitor.ident.size != 2) {
        return 4
    }
    interfaceDecl.dump()
    return 0
}

// ASSERT: scan InterfaceDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "interface"
// ASSERT: scan kind: INTERFACE
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
// ASSERT: scan -superTypes: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -superTypes: 1, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -superTypes: 2, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T3"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan -decls: 0, FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "foo"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 1, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "int64"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
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
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "res"
// ASSERT: scan kind: IDENTIFIER
