// DEPENDENCE: sourceFile/varray_expr.cj
// (not Windows) EXEC: dos2unix varray_expr.cj
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
        let node = parseFile("varray_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testVarrayExpr01() {
        let expr = (nodes[0] as VArrayExpr).getOrThrow()
        let varrayTy = (expr.vArrayType as VArrayType).getOrThrow()
        @Expect(varrayTy.size, 5)
        let elementTy = (varrayTy.elementType as TypeAnnotation).getOrThrow()
        let elementType = (elementTy as AtomicType).getOrThrow()
        match (elementType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        // TODO: check arguments
        @Expect(expr.toString(), "VArray<Int64, $5>([0, 3 ,4])")
        @Expect(parseTokens(expr.toTokens(), refreshPos: false).node.getOrThrow().toString(), expr.toString())
        var pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 22, 2, 23]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 32, 2, 33]).toArray())
        pos  =expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 33]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("varray_expr.cj")
        let input = String.fromUtf8(File.readFrom("varray_expr.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let tmp = (nodes[0] as VArrayExpr).getOrThrow()
        let expr = VArrayExpr(tmp.argument, tmp.vArrayType)
        let varrayTy = (expr.vArrayType as VArrayType).getOrThrow()
        @Expect(varrayTy.size, 5)
        let elementTy = (varrayTy.elementType as TypeAnnotation).getOrThrow()
        let elementType = (elementTy as AtomicType).getOrThrow()
        match (elementType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        // TODO: check arguments
        @Expect(expr.toString(), "VArray<Int64, $5>([0, 3 ,4])")
        var pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 19]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 28, 1, 29]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 29]).toArray())
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
