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
        VArray<Int32, \$10>
    )
    let ty = VArrayType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.dump()
    return 0
}

// ASSERT: scan VArrayType {
// ASSERT: scan -VARRAY: Token {
// ASSERT: scan value: "VArray"
// ASSERT: scan kind: VARRAY
// ASSERT: scan -elementTy: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -dollar: Token {
// ASSERT: scan value: "$"
// ASSERT: scan kind: DOLLAR
// ASSERT: scan -size: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
