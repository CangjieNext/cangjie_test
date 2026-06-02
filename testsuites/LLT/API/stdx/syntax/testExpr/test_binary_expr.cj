/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/binary_expr.cj
// (not Windows) EXEC: dos2unix binary_expr.cj
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
        let node = parseFile("binary_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testBinaryExpr01() {
        let expr = (nodes[0] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Add => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "a + b")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 7, 2, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr02() {
        let expr = (nodes[1] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Equal => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        var pos = lexpr.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 6]).toArray())
        pos = lexpr.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 6, 3, 7]).toArray())
        pos = lexpr.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
        pos = lexpr.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 11, 3, 12]).toArray())
        pos = lexpr.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 14, 3, 15]).toArray())
        pos = lexpr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 15]).toArray())

        let rexpr = (expr.rhs as LitConstExpr).getOrThrow()
        @Expect(rexpr.rawValue, "3")
        @Expect(expr.toString().replace("\r\n", "\n"), "a<b, c, d> == 3")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))

        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 20]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 16, 3, 18]).toArray())
    }

    @TestCase
    func testBinaryExpr03() {
        let expr = (nodes[4] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Div => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "a / b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 6, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 7, 6, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr04() {
        let expr = (nodes[6] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Exp => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as LitConstExpr).getOrThrow()
        @Expect(rexpr.rawValue, "2")
        @Expect(expr.toString().replace("\r\n", "\n"), "a ** 2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 8, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 7, 8, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr05() {
        let expr = (nodes[9] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Ge => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "a >= b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 5, 11, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 7, 11, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr06() {
        let expr = (nodes[7] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Gt => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "a > b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 5, 9, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 7, 9, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr07() {
        let expr = (nodes[10] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Le => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "a <= b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 5, 12, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 7, 12, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr08() {
        let expr = (nodes[36] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.LShift => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a << 2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([45, 5, 45, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([45, 7, 45, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr09() {
        let expr = (nodes[8] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Lt => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a < b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 5, 10, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([10, 7, 10, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr10() {
        let expr = (nodes[5] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Mod => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a % b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 5, 7, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 7, 7, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr11() {
        let expr = (nodes[3] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Mul => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a * b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 5, 5, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 7, 5, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr12() {
        let expr = (nodes[11] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.NotEq => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a != b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 5, 13, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 7, 13, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr13() {
        let expr = (nodes[38] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Or => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a || b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([47, 5, 47, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([47, 7, 47, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr14() {
        let expr = (nodes[39] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Pipeline => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a |> b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([48, 5, 48, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([48, 7, 48, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr15() {
        let expr = (nodes[37] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.RShift => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a >> 2")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([46, 5, 46, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([46, 7, 46, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr16() {
        let expr = (nodes[2] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Sub => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a - b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 7, 4, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr17() {
        let expr = (nodes[2] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Sub => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a - b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 5, 4, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 7, 4, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr18() {
        let expr = (nodes[40] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.And => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a && b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([49, 5, 49, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([49, 7, 49, 9]).toArray())
    }

    @TestCase
    func testBinaryExpr19() {
        let expr = (nodes[20] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.BitAnd => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a & b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([22, 5, 22, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([22, 7, 22, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr20() {
        let expr = (nodes[21] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.BitOr => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a | b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([23, 5, 23, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([23, 7, 23, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr21() {
        let expr = (nodes[24] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.BitXor => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a ^ b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 5, 26, 10]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([26, 7, 26, 8]).toArray())
    }

    @TestCase
    func testBinaryExpr22() {
        let expr = (nodes[35] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Coalescing => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "(A.b) ?? 0")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([44, 5, 44, 15]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([44, 11, 44, 13]).toArray())
    }

    @TestCase
    func testBinaryExpr23() {
        let expr = (nodes[41] as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Composition => ()
            case _ => @FailExpect("kind wrong")
        }
        
        @Expect(expr.toString().replace("\r\n", "\n"), "a ~> b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([50, 5, 50, 11]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([50, 7, 50, 9]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("binary_expr.cj")
        let input = String.fromUtf8(File.readFrom("binary_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as BinaryExpr).getOrThrow()
        let expr = BinaryExpr(tmp.lhs, tmp.opKind, tmp.rhs)
        match (expr.opKind) {
            case BinaryOpKind.Add => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "a + b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 3, 1, 4]).toArray())
    }
}

