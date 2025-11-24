// DEPENDENCE: sourceFile/return_expr.cj
// (not Windows) EXEC: dos2unix return_expr.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readNodes(): Unit {
        let node = parseFile("return_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testReturnExpr01() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        let expr = (body.nodes[0] as ReturnExpr).getOrThrow()
        @Expect(expr.retVal.getOrThrow().toString(), "1")
        @Expect(expr.toString(), "return 1")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 13]).toArray())
        pos = expr.getReturnKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 11]).toArray())
    }

    @TestCase
    func testReturnExpr02() {
        let funcDecl = (decls[1] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        let expr = (body.nodes[0] as ReturnExpr).getOrThrow()
        @Expect(expr.retVal.isNone())
        @Expect(expr.toString(), "return // return nothing")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 6, 29]).toArray())
        pos = expr.getReturnKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 6, 11]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("return_expr.cj")
        let input = String.fromUtf8(File.readFrom("return_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        let tmp = (body.nodes[0] as ReturnExpr).getOrThrow()
        let expr = ReturnExpr(tmp.retVal)
        @Expect(expr.retVal.getOrThrow().toString(), "1")
        @Expect(expr.toString(), "return 1")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 9]).toArray())
        pos = expr.getReturnKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
