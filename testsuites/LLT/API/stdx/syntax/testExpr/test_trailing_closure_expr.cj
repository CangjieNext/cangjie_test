// DEPENDENCE: sourceFile/trailing_closure_expr.cj
// (not Windows) EXEC: dos2unix trailing_closure_expr.cj
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
        let node = parseFile("trailing_closure_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as TrailingClosureExpr).getOrThrow()
        @Expect(expr.toString(), "f  { println() }")
        @Expect(expr.arguments.size, 0)
        let callee = (expr.callee as SymbolRef).getOrThrow()
        @Expect(callee.toString(), "f")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 21]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as TrailingClosureExpr).getOrThrow()
        @Expect(expr.toString(), ##"f(1, "") { a: Int64 => return a}"##)
        @Expect(expr.arguments.size, 2)
        @Expect(expr.arguments[0].toString(), "1")
        @Expect(expr.arguments[1].toString(), ##""""##)
        let callee = (expr.callee as SymbolRef).getOrThrow()
        @Expect(callee.toString(), "f")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 37]).toArray())
        pos = expr.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
        pos = expr.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 6, 3, 7]).toArray())
        pos = expr.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 12, 3, 13]).toArray())
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as TrailingClosureExpr).getOrThrow()
        @Expect(expr.toString(), ##"A.f {println()}"##)
        @Expect(expr.arguments.size, 0)
        let callee = (expr.callee as MemberAccess).getOrThrow()
        @Expect(callee.toString(), "A.f")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 20]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("trailing_closure_expr.cj")
        let input = String.fromUtf8(File.readFrom("trailing_closure_expr.cj"))
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
