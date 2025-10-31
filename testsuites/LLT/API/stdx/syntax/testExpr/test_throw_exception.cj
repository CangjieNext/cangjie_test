// DEPENDENCE: sourceFile/throw_expr.cj
// (not Windows) EXEC: dos2unix throw_expr.cj
// EXEC: export cjStackSize=16mb && %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: export cjStackSize=16mb && %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var nodes: Array<SyntaxTreeNode> = []

    @BeforeAll
    func readNodes(): Unit {
        let node = parseFile("throw_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as ThrowExpr).getOrThrow()
        @Expect(expr.throwVal.toString(), "Exception(\"Exception!\")")
        @Expect(expr.toString(), "throw Exception(\"Exception!\")")
        var pos = expr.getThrowKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 34]).toArray())
    }

    @TestCase
    func testExpr02() {
        let expr = (nodes[1] as ThrowExpr).getOrThrow()
        @Expect(expr.throwVal.toString(), "Exception(\"\${Exception(a)}\")")
        @Expect(expr.toString(), "throw Exception(\"\${Exception(a)}\")")
        var pos = expr.getThrowKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 10]).toArray())
    }

    @TestCase
    func testExpr03() {
        let expr = (nodes[2] as ThrowExpr).getOrThrow()
        @Expect(expr.throwVal.toString(), "Exception(\"\${Exception(a.b)}\")")
        @Expect(expr.toString(), "throw Exception(\"\${Exception(a.b)}\")")
        var pos = expr.getThrowKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 10]).toArray())
    }

    @TestCase
    func testThrowExprInit() {
        let expr = (nodes[2] as ThrowExpr).getOrThrow()
        let throwExpr = ThrowExpr(expr.throwVal)
        @Expect(throwExpr.throwVal.toString(), "Exception(\"\${Exception(a.b)}\")")
        @Expect(throwExpr.toString(), "throw Exception(\"\${Exception(a.b)}\")")
        var pos = throwExpr.getThrowKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("throw_expr.cj")
        let input = String.fromUtf8(File.readFrom("throw_expr.cj"))
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
