/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/do_while_expr.cj
// (not Windows) EXEC: dos2unix do_while_expr.cj
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
        let node = parseFile("do_while_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as DoWhileExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "true")
        @Expect(expr.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(expr.toString().replace("\r\n", "\n"), "do {} while (true)")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        var pos = expr.getDoKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 7]).toArray())
        pos = expr.getWhileKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 11, 2, 16]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 17, 2, 18]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 22, 2, 23]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 23]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as DoWhileExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "x && y + 1 > 3")
        @Expect(expr.body.toString().replace("\r\n", "\n"), """
{
        println()
        return
    }""")
        @Expect(expr.toString().replace("\r\n", "\n"), """
do {
        println()
        return
    } while (x && y + 1 > 3)""")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        var pos = expr.getDoKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 7]).toArray())
        pos = expr.getWhileKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 7, 6, 12]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 13, 6, 14]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 28, 6, 29]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 6, 29]).toArray())
    }

    @TestCase
    func testDoWhileInit() {
        let expr = (nodes[1] as DoWhileExpr).getOrThrow()
        let doWhileExpr = DoWhileExpr(expr.body, expr.condition)
        @Expect(doWhileExpr.condition.toString().replace("\r\n", "\n"), "x && y + 1 > 3")
        @Expect(doWhileExpr.body.toString().replace("\r\n", "\n"), """
{
        println()
        return
    }""")
        @Expect(doWhileExpr.toString().replace("\r\n", "\n"), """
do {
        println()
        return
    } while (x && y + 1 > 3)""")
        var pos = doWhileExpr.getDoKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 3]).toArray())
        pos = doWhileExpr.getWhileKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 7, 4, 12]).toArray())
        pos = doWhileExpr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 13, 4, 14]).toArray())
        pos = doWhileExpr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 28, 4, 29]).toArray())
        pos = doWhileExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 4, 29]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("do_while_expr.cj")
        let input = String.fromUtf8(File.readFrom("do_while_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

