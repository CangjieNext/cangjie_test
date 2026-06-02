/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/wildcard_pattern.cj
// (not Windows) EXEC: dos2unix wildcard_pattern.cj
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
        let node = parseFile("wildcard_pattern.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body =  funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testWildcard01() {
        let matchExpr = (nodes[1] as MatchExpr).getOrThrow()
        let pattern = matchExpr.matchCases[1].patterns[0]

        @Expect(pattern is WildcardPattern)
        @Expect(pattern.toString().replace("\r\n", "\n"), "_")
        @Expect(pattern.toTokens().toString().replace("\r\n", "\n"), "_")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 14, 5, 15]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("wildcard_pattern.cj")
        let input = String.fromUtf8(File.readFrom("wildcard_pattern.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let wildcardPattern = WildcardPattern()
        @Expect(wildcardPattern is WildcardPattern)
        @Expect(wildcardPattern.toString().replace("\r\n", "\n"), "_")
        var pos = wildcardPattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
    }
}

