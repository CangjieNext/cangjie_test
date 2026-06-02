// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_AsExpr {
    @TestCase
    func test_asExpr_01(): Unit {
        let expr = AsExpr(quote(a as b))
        expr.expr = BinaryExpr(quote(a + 1))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a + 1 as b")
    }

    @TestCase
    func test_asExpr_02(): Unit {
        let expr = AsExpr(quote(a as b))
        expr.expr = BinaryExpr(quote(a == b))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a == b) as b")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
