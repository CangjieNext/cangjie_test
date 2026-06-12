/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/break_expr.cj
// (not Windows) EXEC: dos2unix break_expr.cj
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
        let node = parseFile("break_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as BreakExpr).getOrThrow()
        @Expect(expr.toString().replace("\r\n", "\n"), "break")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("break_expr.cj")
        let input = String.fromUtf8(File.readFrom("break_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let expr = BreakExpr()
        @Expect(expr.toString().replace("\r\n", "\n"), "break")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
    }
}

