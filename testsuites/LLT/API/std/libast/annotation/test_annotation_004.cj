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

import std.ast.*

main() {
    var input: Tokens = quote(public func foo<T>(@!Anno["仓颉"] a: Int64) {
    a
})
    let decl = parseDecl(input)
    if (let Some(_decl) <- (decl as FuncDecl)) {
        _decl.funcParams[0].dump()
        return 0
    }
    return 1
}

// ASSERT: scan FuncParam {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: Anno
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "仓颉"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
