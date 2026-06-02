// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*

@Test
class Test_OptionalExpr {
    @TestCase
    func test_OptionalExpr_01(): Unit {
        let expr = OptionalExpr(quote(A?))
        expr.baseExpr = BinaryExpr(quote(A + B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(A + B)?")
    }

    @TestCase
    func test_OptionalExpr_02(): Unit {
        let expr = OptionalExpr(quote(A?))
        expr.baseExpr = AsExpr(quote(A as B))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(A as B)?")
    }

    @TestCase
    func test_OptionalExpr_02_1(): Unit {
        let expr = OptionalExpr(quote(A?))
        expr.baseExpr = IncOrDecExpr(quote(A++))
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(A ++)?")
    }

    @TestCase
    func test_OptionalExpr_03(): Unit {
        let expr = MemberAccess(quote(A?.x))
        match (expr.baseExpr as OptionalExpr) {
            case Some(option) => option.baseExpr = AsExpr(quote(A as TypeA))
            case None => throw ASTException("Cannot construct the 'OptionalExpr' node.")
        }
        let tokens = expr.toTokens()
        println(tokens)
        @Expect(tokens.toString(), "(A as TypeA)?.x")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
