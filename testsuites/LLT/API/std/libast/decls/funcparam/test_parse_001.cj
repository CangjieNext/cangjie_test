// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let param = FuncParam()
    param.not = Token(NOT)
    param.colon = Token(COLON)
    param.identifier = quote(testParam)[0]
    param.paramType = PrimitiveType(quote(Int64))
    param.assign = Token(ASSIGN)
    param.expr = LitConstExpr(quote(1))
    println(param.toTokens())
    return 0
}

/* SCAN-IN
testParam!: Int64 = 1
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
