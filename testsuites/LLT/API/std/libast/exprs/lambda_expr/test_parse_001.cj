// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "{a: Int64, b: Int64 => a + b}"
    let lambdaExprTokens = cangjieLex(code)
    let lambdaExpr = (parseExpr(lambdaExprTokens) as LambdaExpr).getOrThrow()

    let params = lambdaExpr.funcParams
    if (params.size != 2) {
        return 1
    }
    let body = lambdaExpr.nodes
    if (body.size != 1) {
        return 2
    }
    let param1 = params[0]
    var typeStr1 = (param1.paramType as PrimitiveType).getOrThrow().keyword.value
    var ident1 = param1.identifier.value

    if (typeStr1 != "Int64" || ident1 != "a") {
        return 3
    }

    let param2 = params[1]
    var typeStr2 = (param2.paramType as PrimitiveType).getOrThrow().keyword.value
    var ident2 = param2.identifier.value

    if (typeStr2 != "Int64" || ident2 != "b") {
        return 4
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
