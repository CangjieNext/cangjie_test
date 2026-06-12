/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/str_interpolation_content.cj
// (not Windows) EXEC: dos2unix str_interpolation_content.cj
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
        let node = parseFile("str_interpolation_content.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body = funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testExpr01() {
        let strExpr = (nodes[0] as LitConstStrExpr).getOrThrow()
        match(strExpr.strPartExprs[0]) {
            case StrInterpolation(v) => @Expect(v.interpolationBlock.toString().replace("\r\n", "\n"), "{a.toString()}")
                                        @Expect(v.interpolationBlock.toTokens().toString().replace("\r\n", "\n"), "{ a.toString() }")
                                        var pos = v.getDollarPos()
                                        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 6, 2, 7]).toArray())
            case _ => @FailExpect("kind wrong")
        }
        @Expect(strExpr.toString().replace("\r\n", "\n"), #""${a.toString()}abc""#)
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("str_interpolation_content.cj")
        let input = String.fromUtf8(File.readFrom("str_interpolation_content.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let strExpr = (nodes[0] as LitConstStrExpr).getOrThrow()
        match(strExpr.strPartExprs[0]) {
            case StrInterpolation(v) => 
                let strInterpolationContent = StrInterpolationContent(v.interpolationBlock)
                @Expect(strInterpolationContent.interpolationBlock.toString().replace("\r\n", "\n"), "{a.toString()}")
                @Expect(strInterpolationContent.toString().replace("\r\n", "\n"), ##"${a.toString()}"##)
                var pos = strInterpolationContent.getDollarPos()
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
                pos = strInterpolationContent.nodePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 16]).toArray())
            case _ => @FailExpect("kind wrong")
        }
    }

    @TestCase
    func testInit02() {
        let block = Block([SymbolRef("x", []), SymbolRef("y", [])])
        let strInterpolationContent = StrInterpolationContent(block)
        @Expect(strInterpolationContent.interpolationBlock.toString(), "{x; y}")
        @Expect(strInterpolationContent.toString(), ##"${x; y}"##)
    }
}