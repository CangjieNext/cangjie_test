// DEPENDENCE: sourceFile/range_expr.cj
// (not Windows) EXEC: dos2unix range_expr.cj
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
        let node = parseFile("range_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testRangeExpr01() {
        let expr = (nodes[0] as RangeExpr).getOrThrow()
        match (expr.kind) {
            case RangeKind.RangeOp => ()
            case _ => @FailExpect("kind wrong")
        }
        let startEx = (expr.start.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(startEx.rawValue, "1")
        let endEx = (expr.end.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(endEx.rawValue, "100")
        let stepEx = (expr.step.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(stepEx.rawValue, "2")
        @Expect(expr.toString(), "1..100:2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 13]).toArray())
        pos = expr.getRangeOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 8]).toArray())
        pos = expr.getColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 11, 2, 12]).toArray())
    }

    @TestCase
    func testRangeExpr02() {
        let expr = (nodes[1] as RangeExpr).getOrThrow()
        match (expr.kind) {
            case RangeKind.ClosedRangeOp => ()
            case _ => @FailExpect("kind wrong")
        }
        let startEx = (expr.start.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(startEx.rawValue, "0")
        let endEx = (expr.end.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(endEx.rawValue, "10")
        @Expect(expr.step.isNone())
        @Expect(expr.toString(), "0..=10")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 11]).toArray())
        pos = expr.getRangeOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 6, 3, 9]).toArray())
        @Expect(expr.getColonPos().isNone())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("range_expr.cj")
        let input = String.fromUtf8(File.readFrom("range_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as RangeExpr).getOrThrow()
        let expr = RangeExpr(tmp.start, tmp.kind, tmp.end, tmp.step)
        match (expr.kind) {
            case RangeKind.RangeOp => ()
            case _ => @FailExpect("kind wrong")
        }
        let startEx = (expr.start.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(startEx.rawValue, "1")
        let endEx = (expr.end.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(endEx.rawValue, "100")
        let stepEx = (expr.step.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(stepEx.rawValue, "2")
        @Expect(expr.toString(), "1..100 : 2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 11]).toArray())
        pos = expr.getRangeOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 4]).toArray())
        pos = expr.getColonPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 9]).toArray())
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
