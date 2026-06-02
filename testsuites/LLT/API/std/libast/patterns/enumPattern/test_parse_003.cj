// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    let pattern = EnumPattern()
    pattern.constructor = RefExpr(quote(Year))
    pattern.lParen = Token(LPAREN)
    let p1 = VarOrEnumPattern(quote(m)[0])
    let p2 = VarOrEnumPattern(quote(n)[0])
    pattern.patterns = ArrayList<Pattern>([p1, p2])
    pattern.rParen = Token(RPAREN)
    println(pattern.toTokens())

    return 0
}

/* SCAN-IN
Year(m, n)
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
