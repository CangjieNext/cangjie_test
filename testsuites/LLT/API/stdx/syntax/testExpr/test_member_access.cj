/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/member_access.cj
// (not Windows) EXEC: dos2unix member_access.cj
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
        let node = parseFile("member_access.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let expr = (nodes[0] as MemberAccess).getOrThrow()
        @Expect(expr.base.toString().replace("\r\n", "\n"), "A")
        @Expect(expr.field.toString().replace("\r\n", "\n"), "a")
        @Expect(expr.toString().replace("\r\n", "\n"), "A.a")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        var pos = expr.getDotPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 7]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 8]).toArray())
    }

    @TestCase
    func testMemberAccessInit() {
        let expr = (nodes[0] as MemberAccess).getOrThrow()
        let memberAccess = MemberAccess(expr.base, expr.field)
        @Expect(memberAccess.base.toString().replace("\r\n", "\n"), "A")
        @Expect(memberAccess.field.toString().replace("\r\n", "\n"), "a")
        @Expect(memberAccess.toString().replace("\r\n", "\n"), "A.a")
        var pos = memberAccess.getDotPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 3]).toArray())
        pos = memberAccess.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 4]).toArray())
    }

    @TestCase
    func testExpr02() {
        println(nodes[1])
        let expr = (nodes[1] as CallExpr).getOrThrow()
        let memberAccess = (expr.callee as MemberAccess).getOrThrow()
        @Expect(memberAccess.base.toString().replace("\r\n", "\n"), "UInt16")
        @Expect(memberAccess.field.toString().replace("\r\n", "\n"), "parse")
        @Expect(memberAccess.toString().replace("\r\n", "\n"), "UInt16.parse")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))
        var pos = memberAccess.getDotPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 11, 3, 12]).toArray())
        pos = memberAccess.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 17]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("member_access.cj")
        let input = String.fromUtf8(File.readFrom("member_access.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

