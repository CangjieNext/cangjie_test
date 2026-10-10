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

class MyVisitor <: Visitor {}

main() {
    let input = quote(
        main(){
            (a~>b)("hello")
        }
    )
    let node = parseDecl(input)
    node.traverse(MyVisitor())

    let decl = match (node as MainDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    if (decl.block.nodes.size != 1) {
        return 1
    }
    let callExpr = (decl.block.nodes[0] as CallExpr).getOrThrow()
    callExpr.dump()
    0
}

// ASSERT: scan CallExpr {
// ASSERT: scan -callFunc: ParenExpr {
// ASSERT: scan -expr: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "~>"
// ASSERT: scan kind: COMPOSITION
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "hello"
// ASSERT: scan kind: STRING_LITERAL
