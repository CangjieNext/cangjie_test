/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/is_expr.cj
// (not Windows) EXEC: dos2unix is_expr.cj
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
        let node = parseFile("is_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testIsExpr01() {
        let expr = (nodes[1] as IsExpr).getOrThrow()
        @Expect(expr.srcVal.toString().replace("\r\n", "\n"), "a")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as CompositeType).getOrThrow()
        match (targetType.name) {
            case "String" => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "a is String")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), expr.toString().replace("\r\n", "\n"))

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 16]).toArray())
        pos = expr.getIsKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 7, 3, 9]).toArray())
    }

    @TestCase
    func testIsExpr02() {
        let expr = (nodes[0] as IsExpr).getOrThrow()
        @Expect(expr.srcVal.toString().replace("\r\n", "\n"), "b")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as AtomicType).getOrThrow()
        match (targetType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "b is Int64")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 15]).toArray())
        pos = expr.getIsKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 7, 2, 9]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("is_expr.cj")
        let input = String.fromUtf8(File.readFrom("is_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[1] as IsExpr).getOrThrow()
        let expr = IsExpr(tmp.srcVal, tmp.targetTypeAnnotation)
        @Expect(expr.srcVal.toString().replace("\r\n", "\n"), "a")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as CompositeType).getOrThrow()
        match (targetType.name) {
            case "String" => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "a is String")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 12]).toArray())
        pos = expr.getIsKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 3, 1, 5]).toArray())
    }
}

