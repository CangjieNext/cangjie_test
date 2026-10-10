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
        (Int64, Int32) -> Array<String>
    )
    let ty = FuncType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        return 2
    }
    ty.dump()
    return 0
}

// ASSERT: scan FuncType {
// ASSERT: scan -types: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -types: 1, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -ARROW: Token {
// ASSERT: scan value: "->"
// ASSERT: scan kind: ARROW
// ASSERT: scan -returnType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Array"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -typeArguments: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
