/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.{parseExpr, RangeExpr, SubscriptExpr, ASTException}

main() {
    let expr = (parseExpr(quote(arr[..])) as SubscriptExpr).getOrThrow()
    expr.dump()
    let rangeExpr = (expr.indexList[0] as RangeExpr).getOrThrow()
    try {
        rangeExpr.start.dump()
    } catch (_: ASTException) {
        println("No start")
    }
    try {
        rangeExpr.end.dump()
    } catch (_: ASTException) {
        println("No end")
    }
    rangeExpr.toTokens() |> println
    rangeExpr.dump()
}

// ASSERT: scan SubscriptExpr {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arr"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -indexList: 0, RangeExpr {
// ASSERT: scan -op: Token {
// ASSERT: scan value: ".."
// ASSERT: scan kind: RANGEOP
// ASSERT: scan No start
// ASSERT: scan No end
// ASSERT: scan RangeExpr {
// ASSERT: scan -op: Token {
// ASSERT: scan value: ".."
// ASSERT: scan kind: RANGEOP
