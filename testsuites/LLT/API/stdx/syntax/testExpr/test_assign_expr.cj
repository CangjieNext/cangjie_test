// DEPENDENCE: sourceFile/assign_expr.cj
// (not Windows) EXEC: dos2unix assign_expr.cj
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
        let node = parseFile("assign_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testAssignExpr01() {
        let expr = (nodes[0] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.Assign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString(), "a = b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 7, 2, 8]).toArray())
    }

    @TestCase
    func testAssignExpr02() {
        let expr = (nodes[1] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.AddAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "c")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString(), "c += b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 11]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 7, 3, 9]).toArray())
    }

    @TestCase
    func testAssignExpr03() {
        let expr = (nodes[11] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.AndAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "d")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "e")
        @Expect(expr.toString(), "d &&= e")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 5, 20, 12]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([20, 7, 20, 10]).toArray())
    }

    @TestCase
    func testAssignExpr04() {
        let expr = (nodes[12] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.DivAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "d")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "e")
        @Expect(expr.toString(), "d /= e")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 5, 21, 11]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([21, 7, 21, 9]).toArray())
    }

    @TestCase
    func testAssignExpr05() {
        let expr = (nodes[13] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.ExpAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "d")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "e")
        @Expect(expr.toString(), "d **= e")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([22, 5, 22, 12]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([22, 7, 22, 10]).toArray())
    }

    @TestCase
    func testAssignExpr06() {
        let expr = (nodes[14] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.ModAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "d")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "e")
        @Expect(expr.toString(), "d %= e")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([23, 5, 23, 11]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([23, 7, 23, 9]).toArray())
    }

    @TestCase
    func testAssignExpr07() {
        let expr = (nodes[3] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.MulAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString(), "a *= [1, 2, 3]")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 5, 5, 19]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 7, 5, 9]).toArray())
    }

    @TestCase
    func testAssignExpr08() {
        let expr = (nodes[15] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.LShiftAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString(), "a <<= 2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([24, 5, 24, 12]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([24, 7, 24, 10]).toArray())
    }

    @TestCase
    func testAssignExpr09() {
        let expr = (nodes[16] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.OrAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "d")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "e")
        @Expect(expr.toString(), "d ||= e")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([25, 5, 25, 12]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([25, 7, 25, 10]).toArray())
    }

    @TestCase
    func testAssignExpr10() {
        let expr = (nodes[17] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.RShiftAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString(), "a >>= 2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 5, 26, 12]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 7, 26, 10]).toArray())
    }

    @TestCase
    func testAssignExpr11() {
        let expr = (nodes[18] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.SubAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString(), "a -= 2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([27, 5, 27, 11]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([27, 7, 27, 9]).toArray())
    }

    @TestCase
    func testAssignExpr12() {
        let expr = (nodes[19] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.BitAndAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString(), "a &= b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 5, 28, 11]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([28, 7, 28, 9]).toArray())
    }

    @TestCase
    func testAssignExpr13() {
        let expr = (nodes[20] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.BitOrAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString(), "a |= b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([29, 5, 29, 11]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([29, 7, 29, 9]).toArray())
    }

    @TestCase
    func testAssignExpr14() {
        let expr = (nodes[21] as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.BitXorAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString(), "a ^= b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([30, 5, 30, 11]).toArray())
        pos = expr.getAssignOpPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([30, 7, 30, 9]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("assign_expr.cj")
        let input = String.fromUtf8(File.readFrom("assign_expr.cj"))
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
