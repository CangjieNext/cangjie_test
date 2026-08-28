/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.MatchExpr
internal import std.collection.ArrayList

main() {
    let matchExpr = MatchExpr(quote(
        match (x) {
            case 0 => ()
            case _ => ()
        }
    ))
    matchExpr.matchCases.size |> println
    matchExpr.matchCases.clear()
    matchExpr.matchCases.size |> println
    matchExpr.dump()
}

// ASSERT: scan 2
// ASSERT: scan 0
// ASSERT: scan MatchExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "match"
// ASSERT: scan kind: MATCH
// ASSERT: scan -selector: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "x"
// ASSERT: scan kind: IDENTIFIER
