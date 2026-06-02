// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestA {
    @TestCase
    public func funcParamCase01(): Unit {
        let a = FuncParam()
        a.identifier = Token(TokenKind.IDENTIFIER, "a")
        a.colon = Token(TokenKind.COLON)
        a.paramType = RefType(quote(AAA))
        let expected = quote(a: AAA)
        @Expect(compareTokens(expected, a.toTokens()))
    }

    @TestCase
    public func mainDeclCase(): Unit {
        let a = FuncParam()
        a.identifier = Token(TokenKind.IDENTIFIER, "a")
        a.colon = Token(TokenKind.COLON)
        a.paramType = PrimitiveType(quote(Int64))

        let mainDecl = MainDecl(quote(main(p: Int64){ }))
        mainDecl.funcParams.add(a)
        let expected = quote(main(p: Int64, a: Int64){ })
        @Expect(compareTokens(expected, mainDecl.toTokens()))
    }

    @TestCase
    public func lambdaExprCase(): Unit {
        let b = FuncParam()
        b.identifier = Token(TokenKind.IDENTIFIER, "b")
        b.colon = Token(TokenKind.COLON)
        b.paramType = PrimitiveType(quote(Int64))

        let lambdaExpr = LambdaExpr(quote({a: Int64 => a + b}))
        lambdaExpr.funcParams.add(b)
        let expected = quote({a: Int64, b: Int64 => a + b})
        @Expect(compareTokens(expected, lambdaExpr.toTokens()))
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
