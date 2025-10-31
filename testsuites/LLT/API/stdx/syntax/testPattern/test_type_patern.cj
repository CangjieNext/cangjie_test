// DEPENDENCE: sourceFile/type_pattern.cj
// (not Windows) EXEC: dos2unix type_pattern.cj
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
        let node = parseFile("type_pattern.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body =  funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testType01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as TypePattern).getOrThrow()

        @Expect(pattern.patternType.toString(), "Int64")
        @Expect(pattern.subPattern is VarPattern)
        @Expect(pattern.subPattern.toString(), "x")
        @Expect(pattern.toString(), "x: Int64")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 22]).toArray())
        pos = pattern.getColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 15, 5, 16]).toArray())
    }

    @TestCase
    func testType02() {
        let matchExpr = (nodes[3] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as TypePattern).getOrThrow()

        @Expect(pattern.patternType.toString(), "A")
        @Expect(pattern.subPattern is VarPattern)
        @Expect(pattern.subPattern.toString(), "x")
        @Expect(pattern.toString(), "x: A")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("type_pattern.cj")
        let input = String.fromUtf8(File.readFrom("type_pattern.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as TypePattern).getOrThrow()
        let typePattern = TypePattern(pattern.subPattern, pattern.patternType)

        @Expect(typePattern.patternType.toString(), "Int64")
        @Expect(typePattern.subPattern is VarPattern)
        @Expect(typePattern.subPattern.toString(), "x")
        @Expect(typePattern.toString(), "x: Int64")

        var pos = typePattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 9]).toArray())
        pos = typePattern.getColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 3]).toArray())
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
