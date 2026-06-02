// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

class MyVisitor <: Visitor {
    // override public func visit(curNode: Node): Bool { true }
}

main(): Int64 {
    let input1 = quote(
        throw SomeException()
    )

    let expr1 = (parseExpr(input1) as ThrowExpr).getOrThrow()
    let output1 = expr1.toTokens()

    // test toTokens
    if (!compareTokens(input1, output1)) {
        return 1
    }

    //test API
    let expr2 = expr1.expr
    if (!(expr2 is CallExpr)) {
        return 2
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
