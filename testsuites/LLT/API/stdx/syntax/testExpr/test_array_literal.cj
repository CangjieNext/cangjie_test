// DEPENDENCE: sourceFile/array_literal.cj
// (not Windows) EXEC: dos2unix array_literal.cj
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
        let node = parseFile("array_literal.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testArrayLiteral01() {
        let expr = (nodes[0] as ArrayLiteral).getOrThrow()
        @Expect(expr.elements.size, 3)
        @Expect(expr.elements[0].toString(), "1")
        @Expect(expr.elements[1].toString(), "2")
        @Expect(expr.elements[2].toString(), "3")
        @Expect(expr.toString(), "[1, 2, 3]")
        var pos = expr.getLSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 6]).toArray())
        pos = expr.getRSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 13, 2, 14]).toArray())
        pos = expr.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 7, 2, 8]).toArray())
        pos = expr.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 10, 2, 11]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 14]).toArray())
    }

    @TestCase
    func testArrayLiteral02() {
        let expr = (nodes[1] as ArrayLiteral).getOrThrow()
        @Expect(expr.elements.size, 2)
        @Expect(expr.elements[0].toString(), "\"a\"")
        @Expect(expr.elements[1].toString(), "\"b\"")
        @Expect(expr.toString(), "[\"a\", \"b\"]")
        var pos = expr.getLSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 6]).toArray())
        pos = expr.getRSquarePos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 14, 3, 15]).toArray())
        pos = expr.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 3, 10]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("array_literal.cj")
        let input = String.fromUtf8(File.readFrom("array_literal.cj"))
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
