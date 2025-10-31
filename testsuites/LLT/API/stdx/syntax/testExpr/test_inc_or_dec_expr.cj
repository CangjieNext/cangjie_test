// DEPENDENCE: sourceFile/inc_or_dec_expr.cj
// (not Windows) EXEC: dos2unix inc_or_dec_expr.cj
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
        let node = parseFile("inc_or_dec_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testIncOrDecExpr01() {
        let expr = (nodes[0] as IncOrDecExpr).getOrThrow()
        @Expect(expr.operand.toString(), "a")
        match (expr.kind) {
            case IncOrDecOpKind.Incr => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "a++")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 8]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 8]).toArray())
    }

    @TestCase
    func testIncOrDecExpr02() {
        let expr = (nodes[1] as IncOrDecExpr).getOrThrow()
        @Expect(expr.operand.toString(), "b")
        match (expr.kind) {
            case IncOrDecOpKind.Decr => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "b--")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 8]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 6, 3, 8]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("inc_or_dec_expr.cj")
        let input = String.fromUtf8(File.readFrom("inc_or_dec_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as IncOrDecExpr).getOrThrow()
        let expr = IncOrDecExpr(tmp.kind, tmp.operand)
        @Expect(expr.operand.toString(), "a")
        match (expr.kind) {
            case IncOrDecOpKind.Incr => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "a++")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 4]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 4]).toArray())
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
