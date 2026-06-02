/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    var tokens = quote(quote(r'0'))
    var quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())

    tokens = quote(quote('0'))
    quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())

    tokens = quote(quote('''
0'''))
    quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())

    tokens = quote(quote(#'0'#))
    quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())

    tokens = quote(quote(r"0"))
    quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())

    tokens = quote(quote("0"))
    quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())

    tokens = quote(quote("""
0"""))
    quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())

    tokens = quote(quote(#"0"#))
    quoteExpr = (parseExpr(tokens) as QuoteExpr).getOrThrow()
    println(quoteExpr.toTokens())
    return 0
}

/* SCAN-IN
quote(r'0')
quote('0')
quote('''
0''')
quote(#'0'#)
quote(r"0")
quote("0")
quote("""
0""")
quote(#"0"#)
*/