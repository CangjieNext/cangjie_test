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
        spawn (Main) {
            mtx.lock()
            count += 1
            println("CangjieFunc: spawn (Main) ${i}, tid = ${gettid()}")
            unsafe { pthread_self() }
            mtx.unlock()
        }
    )
    let re = match (parseExpr(input) as SpawnExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, re.toTokens())
    if (!flag) {
        return 1
    }
    re.dump()
    return 0
}

// ASSERT: scan SpawnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "spawn"
// ASSERT: scan kind: SPAWN
// ASSERT: scan -threadContext: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Main"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -lambdaExpr: LambdaExpr {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "mtx"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "lock"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, AssignExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "count"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "+="
// ASSERT: scan kind: ADD_ASSIGN
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 2, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "println"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "CangjieFunc: spawn (Main) ${i}, tid = ${gettid()}"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -nodes: 3, Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "pthread_self"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 4, CallExpr {
// ASSERT: scan -callFunc: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "mtx"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "unlock"
// ASSERT: scan kind: IDENTIFIER
