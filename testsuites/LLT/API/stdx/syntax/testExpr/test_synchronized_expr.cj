// DEPENDENCE: sourceFile/synchronized_expr.cj
// (not Windows) EXEC: dos2unix synchronized_expr.cj
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
        let node = parseFile("synchronized_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as SynchronizedExpr).getOrThrow()
        @Expect(expr.structuredMutex.toString(), "obj")
        @Expect(expr.block.toString(), """
{
        while (true) {
            obj.wait()
        }
    }""")
        @Expect(expr.toString(), """
synchronized (obj) {
        while (true) {
            obj.wait()
        }
    }""")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        var pos = expr.getSynchronizedKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 17]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 18, 2, 19]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 22, 2, 23]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 6, 6]).toArray())
    }

    @TestCase
    func testSynchronizedExprInit() {
        let expr = (nodes[0] as SynchronizedExpr).getOrThrow()
        let synchronizedExpr = SynchronizedExpr(expr.block, expr.structuredMutex)
        @Expect(synchronizedExpr.structuredMutex.toString(), "obj")
        @Expect(synchronizedExpr.block.toString(), """
{
        while (true) {
            obj.wait()
        }
    }""")
        @Expect(synchronizedExpr.toString(), """
synchronized (obj) {
        while (true) {
            obj.wait()
        }
    }""")
        var pos = synchronizedExpr.getSynchronizedKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 13]).toArray())
        pos = synchronizedExpr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = synchronizedExpr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 19]).toArray())
        pos = synchronizedExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 5, 6]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("synchronized_expr.cj")
        let input = String.fromUtf8(File.readFrom("synchronized_expr.cj"))
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
