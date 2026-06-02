// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_IncOrDecExpr {
    @TestCase
    func test_IncOrDecExpr_01(): Unit {
        let expr = IncOrDecExpr(quote(a++))
        expr.expr = MemberAccess(quote(A.a))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A.a ++")
    }

    @TestCase
    func test_IncOrDecExpr_02(): Unit {
        let expr = IncOrDecExpr(quote(a++))
        expr.expr = IncOrDecExpr(quote(a++))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a ++) ++")
    }

    @TestCase
    func test_IncOrDecExpr_02_1(): Unit {
        let expr = IncOrDecExpr(quote(a++))
        expr.expr = OptionalExpr(quote(a?))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a?) ++")
    }

    @TestCase
    func test_IncOrDecExpr_03(): Unit {
        let expr = IncOrDecExpr(quote(a++))
        expr.expr = BinaryExpr(quote(A??B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(A ?? B) ++")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
