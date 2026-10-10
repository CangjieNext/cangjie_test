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
        class X{
        }
    )
    let decl = parseDecl(input)
    decl.dump()

    return 0
}

// ASSERT: scan ClassDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "class"
// ASSERT: scan kind: CLASS
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "X"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
