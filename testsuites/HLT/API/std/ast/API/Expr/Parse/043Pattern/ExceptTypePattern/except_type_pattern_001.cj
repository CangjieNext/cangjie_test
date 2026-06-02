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
        try {} catch(_: RunTime) {} finally {}
    )
    let expr = parseExpr(input)
    if (expr is TryExpr) {
        var pattern = match (expr as TryExpr) {
            case Some(v) => v.catchPatterns[0]
            case None => throw Exception("Not TryExpr")
        }
        var patternExcept = match (pattern as ExceptTypePattern) {
            case Some(v) => v
            case None => throw Exception("Not ExceptTypePattern")
        }
        var patternExceptExpr = patternExcept.pattern
        var patternExceptType = patternExcept.types[0]
        var patternExceptTypeValue = match (patternExceptType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (!(pattern is ExceptTypePattern) || !(patternExceptExpr is WildcardPattern) || patternExceptTypeValue !=
            "RunTime") {
            return 1
        }
        return 0
    }
    return 1
}
