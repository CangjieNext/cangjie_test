// DEPENDENCE: sourceFile/unsafe_expr.cj
// (not Windows) EXEC: dos2unix unsafe_expr.cj
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
        let node = parseFile("unsafe_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testUnsafeExpr01() {
        var expr = (nodes[0] as UnsafeExpr).getOrThrow()
        var pos = expr.getUnsafePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 11]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 14]).toArray())
        let expr1 = (nodes[1] as SubscriptExpr).getOrThrow()
        let expr2 = (expr1.base as UnsafeExpr).getOrThrow()
        @Expect(expr2.toString(), "unsafe { data.rawData() }")
        @Expect(expr2.block.toString(), "{ data.rawData() }")
        pos = expr2.getUnsafePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 11]).toArray())
        pos = expr2.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 30]).toArray())
        
    }

    @TestCase
    func testUnsafeExprInit() {
        var expr = (nodes[0] as UnsafeExpr).getOrThrow()
        var unsafeExpr = UnsafeExpr(expr.block)

        var pos = unsafeExpr.getUnsafePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = unsafeExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 10]).toArray())
        let expr1 = (nodes[1] as SubscriptExpr).getOrThrow()
        let expr2 = (expr1.base as UnsafeExpr).getOrThrow()
        unsafeExpr = UnsafeExpr(expr2.block)
        @Expect(unsafeExpr.toString(), "unsafe { data.rawData() }")
        @Expect(unsafeExpr.block.toString(), "{ data.rawData() }")
        pos = unsafeExpr.getUnsafePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = unsafeExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 26]).toArray())
        
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("unsafe_expr.cj")
        let input = String.fromUtf8(File.readFrom("unsafe_expr.cj"))
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
