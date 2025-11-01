// DEPENDENCE: sourceFile/lit_const_expr.cj
// (not Windows) EXEC: dos2unix lit_const_expr.cj
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
        let node = parseFile("lit_const_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testLitConstExpr01() {
        let expr = (nodes[0] as LitConstExpr).getOrThrow()
        match (expr.kind) {
            case LitConstKind.BoolLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.rawValue, "true")
        @Expect(expr.toString(), "true")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 9]).toArray())
    }

    @TestCase
    func testLitConstExpr02() {
        let expr = (nodes[1] as LitConstExpr).getOrThrow()
        match (expr.kind) {
            case LitConstKind.FloatLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.rawValue, "1.0")
        @Expect(expr.toString(), "1.0")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 8]).toArray())
    }

    @TestCase
    func testLitConstExpr03() {
        let expr = (nodes[2] as LitConstExpr).getOrThrow()
        match (expr.kind) {
            case LitConstKind.IntergerLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.rawValue, "123")
        @Expect(expr.toString(), "123")
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 8]).toArray())
    }

    @TestCase
    func testLitConstExpr06() {
        let expr = (nodes[5] as LitConstExpr).getOrThrow()
        match (expr.kind) {
            case LitConstKind.UnitLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.rawValue, "()")
        @Expect(expr.toString(), "()")
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 5, 7, 7]).toArray())
    }

    @TestCase
    func testLitConstExpr07() {
        let expr = (nodes[6] as LitConstExpr).getOrThrow()
        match (expr.kind) {
            case LitConstKind.UnitLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.rawValue, "(     )")
        @Expect(expr.toString(), "(     )")
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 12]).toArray())
    }

    @TestCase
    func testLitConstExprInit01() {
        let expr = (nodes[6] as LitConstExpr).getOrThrow()
        let litConstExpr = LitConstExpr(expr.kind, expr.rawValue)
        match (litConstExpr.kind) {
            case LitConstKind.UnitLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(litConstExpr.rawValue, "(     )")
        @Expect(litConstExpr.toString(), "(     )")
        let pos = litConstExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 8]).toArray())
    }

    @TestCase
    func testLitConstExprInit02() {
        let expr = (nodes[1] as LitConstExpr).getOrThrow()
        let litConstExpr = LitConstExpr(expr.kind, expr.rawValue)
        match (litConstExpr.kind) {
            case LitConstKind.FloatLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(litConstExpr.rawValue, "1.0")
        @Expect(litConstExpr.toString(), "1.0")
        let pos = litConstExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 4]).toArray())
    }

    @TestCase
    func testLitConstExprInit03() {
        let expr = (nodes[2] as LitConstExpr).getOrThrow()
        let litConstExpr = LitConstExpr(expr.kind, expr.rawValue)
        match (litConstExpr.kind) {
            case LitConstKind.IntergerLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(litConstExpr.rawValue, "123")
        @Expect(litConstExpr.toString(), "123")
        let pos = litConstExpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 4]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("lit_const_expr.cj")
        let input = String.fromUtf8(File.readFrom("lit_const_expr.cj"))
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
