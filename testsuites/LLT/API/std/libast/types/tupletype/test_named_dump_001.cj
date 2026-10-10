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

main(): Int64 {
    let input = quote(
        (x: Int64, y: (Int32, Float64))
    )
    let ty = TupleType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.dump()
    return 0
}

// ASSERT: scan TupleType {
// ASSERT: scan -types: 0, PrimitiveType {
// ASSERT: scan -typeParameterName: Token {
// ASSERT: scan value: "x"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -COLON: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -types: 1, TupleType {
// ASSERT: scan -typeParameterName: Token {
// ASSERT: scan value: "y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -COLON: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -types: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -types: 1, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Float64"
// ASSERT: scan kind: FLOAT64
