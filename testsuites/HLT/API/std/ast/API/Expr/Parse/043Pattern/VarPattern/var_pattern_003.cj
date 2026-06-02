/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output


import std.ast.*

main() {
    var input: Tokens = quote(
         match (a) {
            case 1a if (true) => b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr){
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var pattern = match (mh.matchCases[0] as MatchCase){
            case Some(v) => v.patterns
            case None => throw Exception("Not MatchCase")
        }
        return 0
    }
    return 1
}
// ASSERT: scan lex_unexpected_digit
