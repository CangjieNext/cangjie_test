// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_RangeExpr {
    @TestCase
    func test_RangeExpr_01(): Unit {
        let expr = RangeExpr(quote(a .. b))
        expr.start = BinaryExpr(quote(a + 1))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a + 1 .. b")
    }

    @TestCase
    func test_RangeExpr_02(): Unit {
        let expr = RangeExpr(quote(a ..= b))
        expr.start = BinaryExpr(quote(a | c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a | c) ..= b")
    }

    @TestCase
    func test_RangeExpr_03(): Unit {
        let expr = RangeExpr(quote(a ..= b))
        expr.start = RangeExpr(quote(a .. b))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a .. b) ..= b")
    }

    @TestCase
    func test_RangeExpr_04(): Unit {
        let expr = RangeExpr(quote(a ..= b))
        expr.end = UnaryExpr(quote(!b))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a ..= ! b")
    }

    @TestCase
    func test_RangeExpr_05(): Unit {
        let expr = RangeExpr(quote(a ..= b))
        expr.end = RangeExpr(quote(a .. b))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a ..=(a .. b)")
    }

    @TestCase
    func test_RangeExpr_06(): Unit {
        let expr = RangeExpr(quote(a ..= b : 1))
        expr.step = RangeExpr(quote(a .. b))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a ..= b:(a .. b)")
    }

    @TestCase
    func test_RangeExpr_07(): Unit {
        let expr = RangeExpr(quote(a ..= b : 1))
        expr.step = BinaryExpr(quote(a || b))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a ..= b:(a || b)")
    }

    @TestCase
    func test_RangeExpr_08(): Unit {
        let expr = RangeExpr(quote(a ..= b : 1))
        expr.step = BinaryExpr(quote(1 - 0))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a ..= b: 1 - 0")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
