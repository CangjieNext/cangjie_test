// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_SubscriptExpr {
    @TestCase
    func test_SubscriptExpr_01_0(): Unit {
        let expr = SubscriptExpr(quote(A[a]))
        expr.baseExpr = BinaryExpr(quote(A + B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(A + B)[a]")
    }

    @TestCase
    func test_SubscriptExpr_01_1(): Unit {
        let expr = SubscriptExpr(quote(a[b..][c]))
        expr.baseExpr = UnaryExpr(quote(!A))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(! A)[c]")
    }

    @TestCase
    func test_SubscriptExpr_02_3(): Unit {
        let expr = SubscriptExpr(quote(A?[a]))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A?[a]")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
