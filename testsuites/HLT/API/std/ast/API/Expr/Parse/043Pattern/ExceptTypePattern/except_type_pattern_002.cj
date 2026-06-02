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
        try {} catch(e: RunTime | Int64) {} finally {}
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
        var patternExceptExprValue = match (patternExceptExpr as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        var patternExceptType0 = patternExcept.types[0]
        var patternExceptType1 = patternExcept.types[1]
        var patternExceptType0Value = match (patternExceptType0 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var patternExceptType1Value = match (patternExceptType1 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (!(pattern is ExceptTypePattern) || patternExceptExprValue != "e" || patternExceptType0Value != "RunTime" ||
            patternExceptType1Value != "Int64") {
            return 1
        }
        return 0
    }
    return 1
}
