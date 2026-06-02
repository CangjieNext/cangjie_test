// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "foo(1,2,{a:Int32, b:Int32 => a+b})" // foo(LitConstExpr, LitConstExpr, LambdaExpr)
    let callExprTokens = cangjieLex(code)
    let callExpr = (parseExpr(callExprTokens) as CallExpr).getOrThrow()
    let refExpr = (callExpr.callFunc as RefExpr).getOrThrow()
    let identifier = refExpr.identifier
    if (identifier != Token(TokenKind.IDENTIFIER, "foo").addPosition(0, 1, 1)) {
        return 1
    }
    let args = callExpr.arguments // List<FuncArg>
    let size = args.size
    for (i in 0..size) {
        let arg = args[i] // FuncArg
        let expr = arg.expr
        if (expr is LambdaExpr) {
            var lambdaExpr = (expr as LambdaExpr).getOrThrow()
            let params = lambdaExpr.funcParams
            if (params.size != 2) {
                return 2
            }
            let param1 = params[0]
            var typeStr1 = (param1.paramType as PrimitiveType).getOrThrow().keyword.value
            var ident1 = param1.identifier.value

            if (typeStr1 != "Int32" || ident1 != "a") {
                return 3
            }

            let param2 = params[1]
            var typeStr2 = (param1.paramType as PrimitiveType).getOrThrow().keyword.value
            var ident2 = param2.identifier.value

            if (typeStr2 != "Int32" || ident2 != "b") {
                return 4
            }
        }
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
