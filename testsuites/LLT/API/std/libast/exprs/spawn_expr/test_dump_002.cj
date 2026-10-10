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

var res = 0

main() {
    let input = quote(
        func test(){
            spawn{}
        }
        
    )
    let decl = parseDecl(input)
    decl.dump()
}

// ASSERT: scan FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "test"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, SpawnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "spawn"
// ASSERT: scan kind: SPAWN
// ASSERT: scan -lambdaExpr: LambdaExpr {
