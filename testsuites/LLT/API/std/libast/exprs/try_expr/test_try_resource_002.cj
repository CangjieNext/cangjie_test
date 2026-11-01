/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.{TryExpr, Visitor}

class MyVisitor <: Visitor {
    public override func visit(_: TryExpr) {
        println("Inside TryExpr")
    }
}

main() {
    let tryExpr = TryExpr(quote(
        try (x = A(), y = B()) {
            println(x)
            println(y)
        }
    ))
    tryExpr.toTokens() |> println
    tryExpr.dump()
    tryExpr.traverse(MyVisitor())
}

// ASSERT: scan try(x = A()
// ASSERT: scan , y = B()
// ASSERT: scan ) {
// ASSERT: scan println(x)
// ASSERT: scan println(y)
// ASSERT: scan TryExpr {
// ASSERT: scan -keywordT: Token {
// ASSERT: scan value: "try"
// ASSERT: scan kind: TRY
// ASSERT: scan -resourceSpec: 0, VarDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "x"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -resourceSpec: 1, VarDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "B"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -tryBlock: Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "println"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "x"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "println"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan Inside TryExpr