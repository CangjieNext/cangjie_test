// DEPENDENCE: sourceFile/unary_expr.cj
// (not Windows) EXEC: dos2unix unary_expr.cj
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
        let node = parseFile("unary_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testUnaryExpr01() {
        let expr = (nodes[0] as UnaryExpr).getOrThrow()
        match (expr.opKind) {
            case UnaryOpKind.Not => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.operand.toString(), "a")
        @Expect(expr.toString(), "!a")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 7]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 6]).toArray())
    }

    @TestCase
    func testUnaryExpr02() {
        let expr = (nodes[1] as UnaryExpr).getOrThrow()
        match (expr.opKind) {
            case UnaryOpKind.Sub => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.operand.toString(), "a")
        @Expect(expr.toString(), "-a")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 7]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 6]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("unary_expr.cj")
        let input = String.fromUtf8(File.readFrom("unary_expr.cj"))
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
