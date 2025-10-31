// DEPENDENCE: sourceFile/var_pattern.cj
// (not Windows) EXEC: dos2unix var_pattern.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var nodes: Array<SyntaxTreeNode> = []

    @BeforeAll
    func readPatterns(): Unit {
        let node = parseFile("var_pattern.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body =  funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testVar01() {
        let forExpr = (nodes[0] as ForInExpr).getOrThrow()
        let pattern = (forExpr.pattern as VarPattern).getOrThrow()

        @Expect(pattern.name, "i")
        @Expect(pattern.toString(), "i")

        var pos = pattern.nodePos
        // note: need modify after support FOR pos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 10, 2, 11]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("var_pattern.cj")
        let input = String.fromUtf8(File.readFrom("var_pattern.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let forExpr = (nodes[0] as ForInExpr).getOrThrow()
        let pattern = (forExpr.pattern as VarPattern).getOrThrow()
        let varPattern = VarPattern(pattern.name)

        @Expect(varPattern.name, "i")
        @Expect(varPattern.toString(), "i")

        var pos = varPattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
