// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan visit QuoteExpr!

internal import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(curPattern: QuoteExpr) {
        println("visit QuoteExpr!");
    }
}

main(): Int64 {
    let input = quote(func a() { quote(1+2) })
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)
    let intput2 = quote(
        quote(1+2)
    )
    let expr = parseExpr(intput2)
    expr.traverse(myVisitor)
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
