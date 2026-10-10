/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let tokens = quote(func testFunc() {})
    let decl = FuncDecl(tokens)
    let annotation = Annotation(quote(@Frozen))
    decl.annotations = ArrayList<Annotation>([annotation])
    decl.dump()
    return 0
}

// ASSERT: scan FuncDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: Frozen
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "testFunc"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
