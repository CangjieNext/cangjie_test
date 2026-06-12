/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/paren_type.cj
// (not Windows) EXEC: dos2unix paren_type.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readTypes(): Unit {
        let node = parseFile("paren_type.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testType01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as ParenType).getOrThrow()

        @Expect(ty.subType is AtomicType)
        @Expect(ty.subType.toString().replace("\r\n", "\n"), "Int16")
        @Expect(ty.toString().replace("\r\n", "\n"), "(Int16)")
        @Expect(ty.toTokens().toString().replace("\r\n", "\n"), "(Int16)")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 15]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 14, 2, 15]).toArray())
    }

    @TestCase
    func testType02() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as ParenType).getOrThrow()

        @Expect(ty.subType is PrefixType)
        @Expect(ty.subType.toString().replace("\r\n", "\n"), "?Int16")
        @Expect(ty.toString().replace("\r\n", "\n"), "(?Int16)")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 16]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 15, 3, 16]).toArray())
    }

    @TestCase
    func testType03() {
        let varDecl = (decls[3] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as ParenType).getOrThrow()

        @Expect(ty.subType is ParenType)
        @Expect(ty.subType.toString().replace("\r\n", "\n"), "((Int16, Int16))")
        @Expect(ty.toString().replace("\r\n", "\n"), "(((Int16, Int16)))")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 26]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 25, 4, 26]).toArray())
    }

    @TestCase
    func testType04() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let ty = (funcDecl.retTyAnnotation.getOrThrow() as ParenType).getOrThrow()

        @Expect(ty.toString().replace("\r\n", "\n"), "(Int64)")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 25]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 19]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 24, 1, 25]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("paren_type.cj")
        let input = String.fromUtf8(File.readFrom("paren_type.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as ParenType).getOrThrow()
        let parenType = ParenType(ty.subType)

        @Expect(parenType.subType is AtomicType)
        @Expect(parenType.subType.toString().replace("\r\n", "\n"), "Int16")
        @Expect(parenType.toString().replace("\r\n", "\n"), "(Int16)")

        var pos = parenType.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 8]).toArray())
        pos = parenType.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = parenType.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 8]).toArray())
    }
}

