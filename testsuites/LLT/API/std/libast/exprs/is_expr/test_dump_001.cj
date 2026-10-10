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

main(): Int64 {
    let input = quote(
        ("I" == "am") is Bool
    )

    let isExpr = match (parseExpr(input) as IsExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let expr = isExpr.expr
    let ty = isExpr.shiftType
    if (!(expr is ParenExpr)) {
        return 1
    }
    if (!(ty is PrimitiveType)) {
        return 2
    }
    isExpr.dump()
    0
}

// ASSERT: scan IsExpr {
// ASSERT: scan -expr: ParenExpr {
// ASSERT: scan -expr: BinaryExpr {
// ASSERT: scan -leftExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "I"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "=="
// ASSERT: scan kind: EQUAL
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "am"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "is"
// ASSERT: scan kind: IS
// ASSERT: scan -shiftType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Bool"
// ASSERT: scan kind: BOOLEAN
