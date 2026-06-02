// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_assignExpr {
    @TestCase
    func test_assignExpr_01(): Unit {
        let expr = AssignExpr(quote(A = a + b))
        expr.leftExpr = BinaryExpr(quote(A + B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "A + B = a + b")
    }

    @TestCase
    func test_assignExpr_02(): Unit {
        let expr = AssignExpr(quote(A = a + b))
        expr.leftExpr = ReturnExpr(quote(return A))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "return A = a + b")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
