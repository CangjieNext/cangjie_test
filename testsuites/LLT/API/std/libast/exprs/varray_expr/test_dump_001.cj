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
        let arr: VArray<Int64, \$5> = VArray<Int64, \$5> { i => i}
    )
    let decl = match (parseDecl(input) as VarDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, decl.toTokens())
    if (!flag) {
        return 1
    }
    decl.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 2
    }
    decl.dump()

    return 0
}

// ASSERT: scan VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: VArrayType {
// ASSERT: scan -VARRAY: Token {
// ASSERT: scan value: "VArray"
// ASSERT: scan kind: VARRAY
// ASSERT: scan -elementTy: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -dollar: Token {
// ASSERT: scan value: "$"
// ASSERT: scan kind: DOLLAR
// ASSERT: scan -size: Token {
// ASSERT: scan value: "5"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: TrailingClosureExpr {
// ASSERT: scan -expr: VArrayExpr {
// ASSERT: scan -vArrayType: VArrayType {
// ASSERT: scan -VARRAY: Token {
// ASSERT: scan value: "VArray"
// ASSERT: scan kind: VARRAY
// ASSERT: scan -elementTy: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -dollar: Token {
// ASSERT: scan value: "$"
// ASSERT: scan kind: DOLLAR
// ASSERT: scan -size: Token {
// ASSERT: scan value: "5"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -lambdaExpr: LambdaExpr {
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "i"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -paramType:       }
// ASSERT: scan -doubleArrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -nodes: 0, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "i"
// ASSERT: scan kind: IDENTIFIER
