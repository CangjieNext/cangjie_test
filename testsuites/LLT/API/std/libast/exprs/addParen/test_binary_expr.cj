// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_BinaryExpr {
    @TestCase
    func test_binaryExpr_01(): Unit {
        let expr = BinaryExpr(quote(a * b))
        expr.leftExpr = BinaryExpr(quote(a + 1))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a + 1) * b")
    }

    @TestCase
    func test_binaryExpr_02(): Unit {
        let expr = BinaryExpr(quote(a + b))
        expr.leftExpr = BinaryExpr(quote(a * c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a * c + b")
    }

    @TestCase
    func test_binaryExpr_03(): Unit {
        let expr = BinaryExpr(quote(a + b))
        expr.rightExpr = LitConstExpr(quote(-2))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a + - 2")
    }

    @TestCase
    func test_binaryExpr_04(): Unit {
        let expr = BinaryExpr(quote(a + b))
        expr.rightExpr = UnaryExpr(quote(-c))
        let tokens = expr.toTokens()
        println(tokens)
        // Unary negative have higher precedence
        @Expect(tokens.toString(), "a + - c")
    }

    @TestCase
    func test_binaryExpr_04_1(): Unit {
        let expr = BinaryExpr(quote(a + b))
        expr.rightExpr = UnaryExpr(quote(!c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a + ! c")
    }

    @TestCase
    func test_binaryExpr_05_0(): Unit {
        let expr = BinaryExpr(quote(a + b + c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a + b + c")
    }

    @TestCase
    func test_binaryExpr_05_1(): Unit {
        let expr = BinaryExpr(quote(a ** b ** c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a ** b ** c")
    }

    @TestCase
    func test_binaryExpr_05_2(): Unit {
        let expr = BinaryExpr(quote(a ?? b ?? c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a ?? b ?? c")
    }

    @TestCase
    func test_binaryExpr_06_0(): Unit {
        let expr = BinaryExpr(quote(a > b))
        expr.leftExpr = BinaryExpr(quote(a > c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(a > c) > b")
    }

    @TestCase
    func test_binaryExpr_06_1(): Unit {
        let expr = BinaryExpr(quote(a > b))
        expr.rightExpr = BinaryExpr(quote(b == c))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "a >(b == c)")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
