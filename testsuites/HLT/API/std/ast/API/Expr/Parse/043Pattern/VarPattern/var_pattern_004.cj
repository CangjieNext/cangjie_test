/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(
         match (a) {
            case a | b where (true) => b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var patterns = match (mh.matchCases[0] as MatchCase) {
            case Some(v) => v.patterns
            case None => throw Exception("Not MatchCase")
        }
        var patterns0 = match (patterns[0] as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var patterns1 = match (patterns[1] as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        if (patterns.size != 2 || patterns0 != "a" || patterns1 != "b") {
            return 3
        }
        return 0
    }
    return 1
}
