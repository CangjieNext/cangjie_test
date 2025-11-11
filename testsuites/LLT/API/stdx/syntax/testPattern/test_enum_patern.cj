/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/enum_pattern.cj
// (not Windows) EXEC: dos2unix enum_pattern.cj
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
        let node = parseFile("enum_pattern.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body =  funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testEnum01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as EnumPattern).getOrThrow()
        // TestEnum
        @Expect(pattern.enumConstructor.toString(), "A")
        @Expect(pattern.subPatterns.size, 1)
        @Expect(pattern.toString(), "A(n)")
        @Expect(pattern.toTokens().toString(), "A(n)")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 18]).toArray())
        pos = pattern.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 15, 5, 16]).toArray())
        pos = pattern.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 17, 5, 18]).toArray())
        @Expect(pattern.getCommasPos().size, 0)
    }

    @TestCase
    func testEnum02() {
        let matchExpr = (nodes[3] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as EnumPattern).getOrThrow()

        @Expect(pattern.enumConstructor.toString(), "B")
        @Expect(pattern.subPatterns.size, 2)
        @Expect(pattern.toString(), "B(m, n)")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 14, 9, 21]).toArray())
        pos = pattern.enumConstructor.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 14, 9, 15]).toArray())
        pos = pattern.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 15, 9, 16]).toArray())
        pos = pattern.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 17, 9, 18]).toArray())
        pos = pattern.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 20, 9, 21]).toArray())
    }

    @TestCase
    func testEnum03() {
        let matchExpr = (nodes[4] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as EnumPattern).getOrThrow()

        if (let Some(enumType) <- pattern.enumType) {
            @Expect(enumType is CompositeType)
        }
        @Expect(pattern.enumConstructor.toString(), "EnumElement")
        @Expect(pattern.subPatterns.size, 0)
        @Expect(pattern.toString(), "A.B<T>.EnumElement")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 14, 13, 32]).toArray())
        pos = pattern.enumType.getOrThrow().nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 14, 13, 20]).toArray())
        pos = pattern.getDotPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 20, 13, 21]).toArray())
        @Expect(pattern.getLParenPos().isNone(), true)
        @Expect(pattern.getCommasPos().size, 0)
        @Expect(pattern.getRParenPos().isNone(), true)
        pos = pattern.enumConstructor.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([13, 21, 13, 32]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("enum_pattern.cj")
        let input = String.fromUtf8(File.readFrom("enum_pattern.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as EnumPattern).getOrThrow()
        let enumPattern = EnumPattern(pattern.enumConstructor, pattern.enumType, pattern.subPatterns)
        @Expect(enumPattern.enumConstructor.toString(), "A")
        @Expect(enumPattern.subPatterns.size, 1)
        @Expect(enumPattern.toString(), "A(n)")

        var pos = enumPattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = enumPattern.getLParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 3]).toArray())
        pos = enumPattern.getRParenPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 4, 1, 5]).toArray())
        @Expect(enumPattern.getCommasPos().size, 0)
    }
}
