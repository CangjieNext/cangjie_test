/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/call_expr.cj
// (not Windows) EXEC: dos2unix call_expr.cj
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
        let node = parseFile("call_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testCallExpr01() {
        let expr = (nodes[0] as CallExpr).getOrThrow()
        @Expect(expr.callee.toString().replace("\r\n", "\n"), "foo")
        @Expect(expr.arguments.size, 1)
        var pos = expr.arguments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 12]).toArray())
        let arg0 = (expr.arguments[0].value as LitConstExpr).getOrThrow()
        @Expect(arg0.rawValue, "100")
        @Expect(expr.toString().replace("\r\n", "\n"), "foo(100)")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 12, 2, 13]).toArray())
        @Expect(expr.getCommasPos().size, 0)
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 13]).toArray())
    }

    @TestCase
    func testCallExpr02() {
        let expr = (nodes[1] as CallExpr).getOrThrow()
        @Expect(expr.callee.toString().replace("\r\n", "\n"), "foo1")
        @Expect(expr.arguments.size, 4)
        var pos = expr.arguments[2].getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 20, 3, 27]).toArray())
        pos = expr.arguments[2].getColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 27, 3, 28]).toArray())
        pos = expr.arguments[3].getInoutKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 35, 3, 40]).toArray())
        let arg0 = (expr.arguments[0].value as LitConstExpr).getOrThrow()
        let arg1 = (expr.arguments[1].value as LitConstExpr).getOrThrow()
        let arg2 = (expr.arguments[2].value as LitConstExpr).getOrThrow()
        @Expect(arg0.rawValue, "a")
        @Expect(arg1.rawValue, "b")
        @Expect(arg2.rawValue, "true")
        @Expect(expr.toString().replace("\r\n", "\n"), #"foo1("a", "b", isEmpty: true, inout a)"#)
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 3, 10]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 42, 3, 43]).toArray())
        @Expect(expr.getCommasPos().size, 3)
        pos = expr.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 13, 3, 14]).toArray())
        pos = expr.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 18, 3, 19]).toArray())
        pos = expr.getCommasPos()[2]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 33, 3, 34]).toArray())
    }

    @TestCase
    func testCallExpr04() {
        let expr = (nodes[2] as CallExpr).getOrThrow()
        @Expect(expr.callee.toString().replace("\r\n", "\n"), "foo")
        @Expect(expr.arguments.size, 1)
        var pos = expr.arguments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 12, 5, 19]).toArray())
        @Expect(expr.toString().replace("\r\n", "\n"), "foo(   inout a)")
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 8, 5, 9]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 19, 5, 20]).toArray())
        pos = expr.arguments[0].getInoutKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 12, 5, 17]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("call_expr.cj")
        let input = String.fromUtf8(File.readFrom("call_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as CallExpr).getOrThrow()
        let expr = CallExpr(tmp.callee, tmp.arguments)
        @Expect(expr.callee.toString().replace("\r\n", "\n"), "foo")
        @Expect(expr.arguments.size, 1)
        var pos = expr.arguments[0].nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 5, 1, 8]).toArray())
        let arg0 = (expr.arguments[0].value as LitConstExpr).getOrThrow()
        @Expect(arg0.rawValue, "100")
        @Expect(expr.toString().replace("\r\n", "\n"), "foo(100)")
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 4, 1, 5]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 9]).toArray())
        @Expect(expr.getCommasPos().size, 0)
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 9]).toArray())
    }
}

