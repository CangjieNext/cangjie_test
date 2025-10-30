// DEPENDENCE: sourceFile/var_or_enum_pattern.cj
// (not Windows) EXEC: dos2unix var_or_enum_pattern.cj
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
        let node = parseFile("var_or_enum_pattern.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let funcDecl = (file.topLevelDecls[0] as FuncDecl).getOrThrow()
        let body =  funcDecl.body.getOrThrow()
        nodes = body.nodes
    }

    @TestCase
    func testEnum01() {
        let matchExpr = (nodes[2] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as EnumPattern).getOrThrow()

        if (let Some(ty) <- pattern.enumType) {
            @Expect(ty.name, "TestEnum")
        }
        @Expect(pattern.enumConstructor.toString(), "A")
        @Expect(pattern.toString(), "TestEnum.A")
    }

    @TestCase
    func testEnum02() {
        let matchExpr = (nodes[3] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as VarOrEnumPattern).getOrThrow()

        @Expect(pattern.identifier, "B")
        @Expect(pattern.toString(), "B")

        var pos = pattern.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 14, 9, 15]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("var_or_enum_pattern.cj")
        let input = String.fromUtf8(File.readFrom("var_or_enum_pattern.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let matchExpr = (nodes[3] as MatchExpr).getOrThrow()
        let pattern = (matchExpr.matchCases[0].patterns[0] as VarOrEnumPattern).getOrThrow()
        let varOrEnumPattern = VarOrEnumPattern(pattern.identifier)

        @Expect(varOrEnumPattern.identifier, "B")
        @Expect(varOrEnumPattern.toString(), "B")

        var pos = varOrEnumPattern.nodePos
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
