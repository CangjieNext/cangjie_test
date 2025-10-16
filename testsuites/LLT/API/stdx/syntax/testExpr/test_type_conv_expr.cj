// DEPENDENCE: sourceFile/type_conv_expr.cj
// (not Windows) EXEC: dos2unix type_conv_expr.cj
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
        let node = parseFile("type_conv_expr.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testTypeConvExpr01() {
        let expr = (nodes[0] as TypeConvExpr).getOrThrow()
        @Expect(expr.srcVal.toString(), "32")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as AtomicType).getOrThrow()
        match (targetType.kind) {
            case Int8Type => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "Int8(32)")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 13]).toArray())
        pos = expr.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 10]).toArray())
        pos = expr.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 12, 2, 13]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("type_conv_expr.cj")
        let input = String.fromUtf8(File.readFrom("type_conv_expr.cj"))
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
