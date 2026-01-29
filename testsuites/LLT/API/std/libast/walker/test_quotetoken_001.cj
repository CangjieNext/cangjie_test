/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.{Visitor, QuoteExpr, QuoteToken, Expr}

class MyVisitor1 <: Visitor {
    public override func visit(_: QuoteToken) {
        println("Visiting QuoteToken")
    }
}

class MyVisitor2 <: Visitor {
    public override func visit(_: Expr) {
        println("Visiting Expr")
    }
}

main(): Unit {
    let tokens = quote(quote(x + 1))
    let quoteExpr = QuoteExpr(tokens)
    let quoteToken = quoteExpr.exprs[0]

    quoteToken.traverse(MyVisitor1())
    quoteToken.traverse(MyVisitor2())
}

/* SCAN
Visiting QuoteToken
Visiting Expr
*/