// DEPENDENCE: sourceFile/subscript_expr.cj
// (not Windows) EXEC: dos2unix subscript_expr.cj
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
        let node = parseFile("subscript_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as SubscriptExpr).getOrThrow()
        @Expect(expr.base.toString(), "a")
        @Expect(expr.indexs.size, 1)
        @Expect(expr.indexs[0].toString(), "0")
        @Expect(expr.toString(), "a[0]")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        var pos = expr.getLSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 7]).toArray())
        pos = expr.getRSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 9]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as SubscriptExpr).getOrThrow()
        let base = (expr.base as SubscriptExpr).getOrThrow()
        let index = (expr.indexs[0] as SubscriptExpr).getOrThrow()
        @Expect(base.toString(), "a[x]")
        @Expect(expr.indexs.size, 1)
        @Expect(expr.indexs[0].toString(), "b.c[1]")
        @Expect(index.base is MemberAccess)
        @Expect(index.base.toString(), "b.c")
        @Expect(expr.toString(), "a[x][b.c[1]]")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        var pos = expr.getLSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 3, 10]).toArray())
        pos = expr.getRSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 16, 3, 17]).toArray())
    }

    @TestCase
    func testExpr04() {
        let expr = (nodes[3] as SubscriptExpr).getOrThrow()
        @Expect(expr.toString(), "a[0, 1, 2]")
        var pos = expr.getLSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 6, 5, 7]).toArray())
        pos = expr.getRSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 15]).toArray())
        pos = expr.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 8, 5, 9]).toArray())
        pos = expr.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 11, 5, 12]).toArray())
    }

    @TestCase
    func testSubscriptExprInit() {
        let expr = (nodes[1] as SubscriptExpr).getOrThrow()
        var subscriptExpr = SubscriptExpr(expr.base, expr.indexs)
        let base = (subscriptExpr.base as SubscriptExpr).getOrThrow()
        let index = (subscriptExpr.indexs[0] as SubscriptExpr).getOrThrow()
        @Expect(base.toString(), "a[x]")
        @Expect(subscriptExpr.indexs.size, 1)
        @Expect(subscriptExpr.indexs[0].toString(), "b.c[1]")
        @Expect(index.base is MemberAccess)
        @Expect(index.base.toString(), "b.c")
        @Expect(subscriptExpr.toString(), "a[x][b.c[1]]")
        var pos = subscriptExpr.getLSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 5, 1, 6]).toArray())
        pos = subscriptExpr.getRSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 12, 1, 13]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("subscript_expr.cj")
        let input = String.fromUtf8(File.readFrom("subscript_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
