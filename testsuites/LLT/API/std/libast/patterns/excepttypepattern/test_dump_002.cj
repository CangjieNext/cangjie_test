/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main(): Int64 {
    let tokens = quote( e: Exception1 | Exception2 )
    let aa = ExceptTypePattern(tokens)
    aa.dump()
    return 0
}

// ASSERT: scan ExceptTypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -types: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Exception1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -types: 1, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Exception2"
// ASSERT: scan kind: IDENTIFIER
