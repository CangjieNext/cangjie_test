// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_CallExpr {
    @TestCase
    func test_CallExpr_01(): Unit {
        let expr = CallExpr(quote(A(a, b)))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A(a, b)")
    }

    @TestCase
    func test_CallExpr_02(): Unit {
        let expr = CallExpr(quote(A(a, b)))
        expr.callFunc = BinaryExpr(quote(a |> B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a |> B)(a, b)")
    }

    @TestCase
    func test_CallExpr_03(): Unit {
        let expr = CallExpr(quote(A(a, b)))
        expr.callFunc = MemberAccess(quote(A.a))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A.a(a, b)")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
