/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/for_in_expr.cj
// (not Windows) EXEC: dos2unix for_in_expr.cj
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
        let node = parseFile("for_in_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as ForInExpr).getOrThrow()
        @Expect(expr.pattern.toString().replace("\r\n", "\n"), "(x, y)")
        @Expect(expr.expr.toString().replace("\r\n", "\n"), "array")
        @Expect(expr.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(expr.patternGuard.isNone())
        @Expect(expr.toString().replace("\r\n", "\n"), "for ((x, y) in array) {}")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        var pos = expr.getForKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 8]).toArray())
        pos = expr.getInKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 17, 2, 19]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 10]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 25, 2, 26]).toArray())
        @Expect(expr.getWhereKeyWordPos().isNone())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 29]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as ForInExpr).getOrThrow()
        @Expect(expr.pattern.toString().replace("\r\n", "\n"), "i")
        @Expect(expr.expr.toString().replace("\r\n", "\n"), "0..10")
        @Expect(expr.body.toString().replace("\r\n", "\n"), """
{
        println(i)
    }""")
        @Expect(expr.patternGuard.getOrThrow().toString().replace("\r\n", "\n"), "i % 2 == 1")
        @Expect(expr.toString().replace("\r\n", "\n"), """
for (i in 0..10 where i % 2 == 1) {
        println(i)
    }""")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        var pos = expr.getForKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 8]).toArray())
        pos = expr.getInKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 12, 3, 14]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 3, 10]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 37, 3, 38]).toArray())
        pos = expr.getWhereKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 21, 3, 26]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 5, 6]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("for_in_expr.cj")
        let input = String.fromUtf8(File.readFrom("for_in_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as ForInExpr).getOrThrow()
        let expr = ForInExpr(tmp.body, tmp.expr, tmp.pattern, tmp.patternGuard)
        @Expect(expr.pattern.toString().replace("\r\n", "\n"), "(x, y)")
        @Expect(expr.expr.toString().replace("\r\n", "\n"), "array")
        @Expect(expr.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(expr.patternGuard.isNone())
        @Expect(expr.toString().replace("\r\n", "\n"), "for ((x, y) in array) {}")
        var pos = expr.getForKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 4]).toArray())
        pos = expr.getInKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 13, 1, 15]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 5, 1, 6]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 21, 1, 22]).toArray())
        @Expect(expr.getWhereKeyWordPos().isNone())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 25]).toArray())
    }
}

