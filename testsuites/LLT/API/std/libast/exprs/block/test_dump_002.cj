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
    var cnt = 0
    public override func visit(curNode: CallExpr) {
        cnt += 1
    }
    public override func visit(curNode: VarDecl) {
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        unsafe {
            let src = acquireArrayRawData(data)
            let dst = acquireArrayRawData(ret)
            memcpy_s(CPointer<UInt8>(dst.pointer), UIntNative(8), src.pointer, UIntNative(8))
            releaseArrayRawData(src)
            releaseArrayRawData(dst)
        }
    )
    let block = parseExpr(input)
    if (!(block is Block)) {
        return 1
    }

    if ((block as Block).getOrThrow().nodes.size != 5) {
        return 2
    }
    block.traverse(myVisitor)
    if (myVisitor.cnt != 4) {
        return 3
    }

    let output = quote($block)
    let flag = compareTokens(input, output)
    if (!flag) {
        return 4
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
// ASSERT: scan value: "src"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "acquireArrayRawData"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "data"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "dst"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "acquireArrayRawData"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "ret"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 2, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "memcpy_s"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "CPointer"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan typeArguments: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "UInt8"
// ASSERT: scan kind: UINT8
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "dst"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "pointer"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 1, Argument {
// ASSERT: scan -expr: TypeConvExpr {
// ASSERT: scan -targetType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "UIntNative"
// ASSERT: scan kind: UINTNATIVE
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "8"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -arguments: 2, Argument {
// ASSERT: scan -expr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "src"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "pointer"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 3, Argument {
// ASSERT: scan -expr: TypeConvExpr {
// ASSERT: scan -targetType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "UIntNative"
// ASSERT: scan kind: UINTNATIVE
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "8"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 3, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "releaseArrayRawData"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "src"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 4, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "releaseArrayRawData"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "dst"
// ASSERT: scan kind: IDENTIFIER
