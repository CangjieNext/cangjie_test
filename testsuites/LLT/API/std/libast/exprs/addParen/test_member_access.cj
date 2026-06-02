// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_MemberAccessExpr {
    @TestCase
    func test_MemberAccessExpr_01_0(): Unit {
        let expr = MemberAccess(quote(A.b))
        expr.baseExpr = BinaryExpr(quote(A + B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(A + B).b")
    }

    @TestCase
    func test_MemberAccessExpr_01_1(): Unit {
        let expr = MemberAccess(quote(A.b))
        expr.baseExpr = UnaryExpr(quote(!B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(! B).b")
    }

    @TestCase
    func test_MemberAccessExpr_01_2(): Unit {
        let expr = MemberAccess(quote(Int64(a).b))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "Int64(a).b")
    }

    @TestCase
    func test_MemberAccessExpr_02_0(): Unit {
        let expr = MemberAccess(quote(A.b))
        expr.baseExpr = MemberAccess(quote(A.a))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A.a.b")
    }

    @TestCase
    func test_MemberAccessExpr_02_1(): Unit {
        let expr = MemberAccess(quote(A.b))
        expr.baseExpr = SubscriptExpr(quote(A[a]))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A[a].b")
    }

    @TestCase
    func test_MemberAccessExpr_02_2(): Unit {
        let expr = MemberAccess(quote(A[2].a))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A[2].a")
    }

    @TestCase
    func test_MemberAccessExpr_02_3(): Unit {
        let expr = MemberAccess(quote(A?.a))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A?.a")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
