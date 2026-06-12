/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/optional_expr.cj
// (not Windows) EXEC: dos2unix optional_expr.cj
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
        let node = parseFile("optional_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testOptionalExpr01() {
        let callExpr = (nodes[0] as CallExpr).getOrThrow()
        let expr = (callExpr.callee as OptionalExpr).getOrThrow()
        @Expect(expr.base.toString().replace("\r\n", "\n"), "a")
        @Expect(expr.toString().replace("\r\n", "\n"), "a?")
        @Expect(expr.toTokens().toString().replace("\r\n", "\n"), "a?")


        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 7]).toArray())
        pos = expr.getQuestionPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 7]).toArray())
    }

    @TestCase
    func testOptionalExprInit() {
        let callExpr = (nodes[0] as CallExpr).getOrThrow()
        let expr = (callExpr.callee as OptionalExpr).getOrThrow()
        let optionalExpr = OptionalExpr(expr.base)
        @Expect(optionalExpr.base.toString().replace("\r\n", "\n"), "a")
        @Expect(optionalExpr.toString().replace("\r\n", "\n"), "a?")

        var pos = optionalExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 3]).toArray())
        pos = optionalExpr.getQuestionPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 3]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("optional_expr.cj")
        let input = String.fromUtf8(File.readFrom("optional_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

