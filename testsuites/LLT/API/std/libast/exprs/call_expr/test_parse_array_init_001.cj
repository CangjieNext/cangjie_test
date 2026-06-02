// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

//The purpose of this file is to test the function of APIs.

internal import std.ast.*

main(): Int64 {
    let code = """
           Array<Int32>(10,item:2)
        """

    let arraysizedlitTokens = cangjieLex(code)
    let arraysizedLit = (parseExpr(arraysizedlitTokens) as CallExpr).getOrThrow()
    let tys = (arraysizedLit.callFunc as RefExpr).getOrThrow().typeArguments
    if (tys.size != 1) {
        return 1
    }
    let ty = tys[0]
    let args = arraysizedLit.arguments
    if (args.size != 2) {
        return 2
    }
    let size = args[0].expr
    let expr = args[1].expr

    if ((ty as PrimitiveType).getOrThrow().keyword.value != "Int32") {
        return 3
    }
    if ((size as LitConstExpr).getOrThrow().literal.value != "10") {
        return 4
    }
    if ((expr as LitConstExpr).getOrThrow().literal.value != "2") {
        return 5
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
