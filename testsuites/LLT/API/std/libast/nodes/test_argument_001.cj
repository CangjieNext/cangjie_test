// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestA {
    @TestCase
    public func callExprCase(): Unit {
        let a = Argument()
        a.identifier = Token(TokenKind.IDENTIFIER, "a")
        a.expr = RefExpr(quote(value))
        a.keyword = Token(AND)
        a.colon = Token(COLON)

        let callExpr = CallExpr(quote(foo(b: 64)))
        callExpr.arguments.add(a)
        let expected = quote(foo(b: 64, && a: value))
        @Expect(compareTokens(expected, callExpr.toTokens()))
    }

    @TestCase
    public func annoCase(): Unit {
        let a = Argument()
        a.expr = RefExpr(quote(value))
        let tk = quote(
            @CallingConv[test]
        )
        let anno = Annotation(tk)
        anno.arguments.add(a)
        println(anno.toTokens())
        let expected = quote(@CallingConv[test, value])
        @Expect(compareTokens(expected, anno.toTokens()))
    }

    @TestCase
    public func exceptionCase(): Unit {
        let arg = Argument()
        @ExpectThrows[ASTException](arg.identifier = Token(BREAK))
        @ExpectThrows[ASTException](arg.identifier = Token(IDENTIFIER, ""))
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
