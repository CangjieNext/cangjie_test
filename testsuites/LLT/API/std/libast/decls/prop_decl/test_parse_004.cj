/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main() {
    let input = quote(
        static mut prop i : Int64 {
            get(){println("after_get");return 0}
            set(x){println("after_set")}
        }
    )
    let decl = (parseDecl(input) as PropDecl).getOrThrow()
    let setter = parseDecl(decl.setter.toTokens(), astKind: "PropMemberDecl")
    if (!(setter is FuncDecl)) {
        return 1
    }
    let setter1 = (setter as FuncDecl).getOrThrow()
    if (setter1.block.nodes.size != 1) {
        return 2
    }
    let getter = parseDecl(decl.getter.toTokens(), astKind: "PropMemberDecl")
    if (!(getter is FuncDecl)) {
        return 3
    }
    setter.dump()
    getter.dump()
    return 0
}

// ASSERT: scan FuncDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "set"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "x"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -paramType:   }
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "println"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "after_set"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan FuncDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "get"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "println"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "after_get"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -nodes: 1, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
