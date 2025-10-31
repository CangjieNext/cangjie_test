// DEPENDENCE: sourceFile/quote_expr.cj
// (not Windows) EXEC: dos2unix quote_expr.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var nodes: Array<SyntaxTreeNode> = []

    @BeforeAll
    func readNodes(): Unit {
        let node = parseFile("quote_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as QuoteExpr).getOrThrow()
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString(), "public func test(): Unit")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "quote(public func test(): Unit)")
        var pos = expr.getQuoteKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 10, 2, 11]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 35, 2, 36]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as QuoteExpr).getOrThrow()
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString(), """
public func test(): Unit {
        return
    }""")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), """
quote(public func test(): Unit {
        return
    })""")
        var pos = expr.getQuoteKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 10]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 10, 3, 11]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 6, 5, 7]).toArray())
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as QuoteExpr).getOrThrow()
        @Expect(expr.tokensOrRefExpr.size, 5)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString(), "public func")
                                 var pos = v.nodePos
                                 @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 11, 6, 22]).toArray())
            case _ => @FailExpect("kind wrong")
        }
        match(expr.tokensOrRefExpr[1]) {
            case QuoteInterpolation(v) => @Expect(v.expr.toString(), "name")
                                          @Expect(v.toString(), "\$name")
                                          var pos = v.getDollarPos()
                                          @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 23, 6, 24]).toArray())
                                          pos = v.nodePos
                                          @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 23, 6, 28]).toArray())
                                          
            case _ => @FailExpect("kind wrong")
        }
        match(expr.tokensOrRefExpr[2]) {
            case TokenPart(v) => @Expect(v.toString(), "():")
            case _ => @FailExpect("kind wrong")
        }
        match(expr.tokensOrRefExpr[3]) {
            case QuoteInterpolation(v) => @Expect(v.expr.toString(), "function.typename")
                                          @Expect(v.toString(), "\$(function.typename)")
                                          var pos = v.getDollarPos()
                                          @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 32, 6, 33]).toArray())
                                          pos = v.getLParenPos().getOrThrow()
                                          @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 33, 6, 34]).toArray())
                                          pos = v.getRParenPos().getOrThrow()
                                          @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 51, 6, 52]).toArray())
            case _ => @FailExpect("kind wrong")
        }
        match(expr.tokensOrRefExpr[4]) {
            case TokenPart(v) => @Expect(v.toString(), "{}")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "quote(public func \$name(): \$(function.typename) {})")
        var pos = expr.getQuoteKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 6, 10]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 10, 6, 11]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 55, 6, 56]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 6, 56]).toArray())
    }

    @TestCase
    func testExpr04() {
        let expr = (nodes[3] as QuoteExpr).getOrThrow()
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString(), ##"var str = #"aa"#"##)
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), ##"quote(var str = #"aa"#)"##)
    }

    @TestCase
    func testExpr08() {
        let expr = (nodes[7] as QuoteExpr).getOrThrow()
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString(), #"\(\)"#)
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), #"quote   (\(\))"#)
        var pos = expr.getQuoteKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 5, 12, 10]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 13, 12, 14]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 18, 12, 19]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("quote_expr.cj")
        let input = String.fromUtf8(File.readFrom("quote_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as QuoteExpr).getOrThrow()
        let expr = QuoteExpr(tmp.tokensOrRefExpr)
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString(), "public func test(): Unit")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "quote(public func test(): Unit)")
        var pos = expr.getQuoteKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 7]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 31, 1, 32]).toArray())
    }

    @TestCase
    func testQuoteTokenInit01() {
        let tmp = (nodes[0] as QuoteExpr).getOrThrow()
        let expr = QuoteExpr(tmp.tokensOrRefExpr)
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) =>
                let quoteToken = QuoteToken(v.content)
                @Expect(quoteToken.toString(), "public func test(): Unit")
                var pos = quoteToken.nodePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 25]).toArray())
            case _ => @FailExpect("kind wrong")
        }
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
