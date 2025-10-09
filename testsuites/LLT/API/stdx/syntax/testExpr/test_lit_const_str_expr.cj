// DEPENDENCE: sourceFile/lit_const_str_expr.cj
// (not Windows) EXEC: dos2unix lit_const_str_expr.cj
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
        let node = parseFile("lit_const_str_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testLitConstStrExpr01() {
        let expr = (nodes[0] as LitConstStrExpr).getOrThrow()
        match (expr.strKind) {
            case LitConstStrKind.StringLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.delimiterNum, 0)
        @Expect(expr.isSingleQuote, false)
        @Expect(expr.rawValue, "me")
        @Expect(expr.toString(), "\"me\"")
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 9]).toArray())
    }

    @TestCase
    func testLitConstStrExpr02() {
        let expr = (nodes[1] as LitConstStrExpr).getOrThrow()
        match (expr.strKind) {
            case LitConstStrKind.MultiLineRawString => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.delimiterNum, 1)
        @Expect(expr.isSingleQuote, false)
        @Expect(expr.rawValue, "hi")
        @Expect(expr.toString(), """
#"hi"#""")
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 11]).toArray())
    }

    @TestCase
    func testLitConstStrExpr03() {
        let expr = (nodes[2] as LitConstStrExpr).getOrThrow()
        match (expr.strKind) {
            case LitConstStrKind.StringLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.delimiterNum, 0)
        @Expect(expr.isSingleQuote, true)
        @Expect(expr.strPartExprs.size, 1)
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 13]).toArray())
    }

    @TestCase
    func testLitConstStrExpr04() {
        let expr = (nodes[3] as LitConstStrExpr).getOrThrow()
        match (expr.strKind) {
            case LitConstStrKind.MultiLineString => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.delimiterNum, 0)
        @Expect(expr.isSingleQuote, false)
        @Expect(expr.strPartExprs.size, 4)
        @Expect(expr.hasInterpolation(), true)
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 5, 7, 23]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("lit_const_str_expr.cj")
        let input = String.fromUtf8(File.readFrom("lit_const_str_expr.cj"))
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
