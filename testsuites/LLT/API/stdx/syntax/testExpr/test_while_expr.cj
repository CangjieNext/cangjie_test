// DEPENDENCE: sourceFile/while_expr.cj
// (not Windows) EXEC: dos2unix while_expr.cj
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
        let node = parseFile("while_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as WhileExpr).getOrThrow()
        @Expect(expr.condition.toString(), "true")
        @Expect(expr.body.toString(), "{}")
        @Expect(expr.toString(), "while (true) {}")

        var pos = expr.getWhileKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 11, 2, 12]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 16, 2, 17]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 20]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as WhileExpr).getOrThrow()
        @Expect(expr.condition.toString(), "x && y + 1 > 3")
        @Expect(expr.body.toString(), """
{
        println()
        return
    }""")
        @Expect(expr.toString(), """
while (x && y + 1 > 3) {
        println()
        return
    }""")
        var pos = expr.getWhileKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 10]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 11, 3, 12]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 26, 3, 27]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 6, 6]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("while_expr.cj")
        let input = String.fromUtf8(File.readFrom("while_expr.cj"))
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
