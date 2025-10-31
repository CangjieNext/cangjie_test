// DEPENDENCE: sourceFile/const_pattern.cj
// (not Windows) EXEC: dos2unix const_pattern.cj
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
        let node = parseFile("const_pattern.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body =  funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testConst01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as ConstPattern).getOrThrow()

        @Expect(pattern.litConstExpr.rawValue, "1")
        @Expect(pattern.toString(), "1")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 15]).toArray())
    }

    @TestCase
    func testConst02() {
        let matchExpr = (nodes[3] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as ConstPattern).getOrThrow()

        @Expect(pattern.litConstExpr.rawValue, "true")
        @Expect(pattern.toString(), "true")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("const_pattern.cj")
        let input = String.fromUtf8(File.readFrom("const_pattern.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as ConstPattern).getOrThrow()
        let constPattern = ConstPattern(pattern.litConstExpr)

        @Expect(constPattern.litConstExpr.rawValue, "1")
        @Expect(constPattern.toString(), "1")

        var pos = constPattern.nodePos
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
