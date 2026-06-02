// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-begin ASTException: Cannot get else expr from current If expression

internal import std.ast.*

main(): Int64 {
    let tokens = quote(if (true) { foo() })
    let ifExpr = IfExpr(tokens)
    try {
        let elseExpr = ifExpr.elseExpr
    } catch (e: ASTException) {
        println(e)
        return 0
    }
    return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
