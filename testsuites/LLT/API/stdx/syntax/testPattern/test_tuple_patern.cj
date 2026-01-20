/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/tuple_pattern.cj
// (not Windows) EXEC: dos2unix tuple_pattern.cj
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
        let node = parseFile("tuple_pattern.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body =  funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testTuple01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as TuplePattern).getOrThrow()

        @Expect(pattern.subPatterns.size, 2)
        @Expect(pattern.subPatterns[0] is VarOrEnumPattern)
        @Expect(pattern.subPatterns[0].toString(), "x")
        @Expect(pattern.subPatterns[1] is VarOrEnumPattern)
        @Expect(pattern.subPatterns[1].toString(), "y")
        @Expect(pattern.toString(), "(x, y)")
        @Expect(pattern.toTokens().toString(), "(x, y)")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 20]).toArray())
        pos = pattern.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 15]).toArray())
        pos = pattern.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 19, 5, 20]).toArray())
        pos = pattern.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 16, 5, 17]).toArray())
    }

    @TestCase
    func testTuple02() {
        let matchExpr = (nodes[3] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as TuplePattern).getOrThrow()

        @Expect(pattern.subPatterns.size, 2)
        @Expect(pattern.subPatterns[0] is ConstPattern)
        @Expect(pattern.subPatterns[0].toString(), "\"abc\"")
        @Expect(pattern.subPatterns[1] is VarOrEnumPattern)
        @Expect(pattern.subPatterns[1].toString(), "x")
        @Expect(pattern.toString(), "(\"abc\", x)")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("tuple_pattern.cj")
        let input = String.fromUtf8(File.readFrom("tuple_pattern.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as TuplePattern).getOrThrow()
        let tuplePattern = TuplePattern(pattern.subPatterns)

        @Expect(tuplePattern.subPatterns.size, 2)
        @Expect(tuplePattern.subPatterns[0] is VarOrEnumPattern)
        @Expect(tuplePattern.subPatterns[0].toString(), "x")
        @Expect(tuplePattern.subPatterns[1] is VarOrEnumPattern)
        @Expect(tuplePattern.subPatterns[1].toString(), "y")
        @Expect(tuplePattern.toString(), "(x, y)")

        var pos = tuplePattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = tuplePattern.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = tuplePattern.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 6, 1, 7]).toArray())
        pos = tuplePattern.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 3, 1, 4]).toArray())
    }

    @TestCase
    func testInit02() {
        let varPattern = VarPattern("i")
        @AssertThrows[Exception](TuplePattern([varPattern]))
    }
}