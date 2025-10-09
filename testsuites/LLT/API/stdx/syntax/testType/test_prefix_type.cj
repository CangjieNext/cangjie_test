// DEPENDENCE: sourceFile/prefix_type.cj
// (not Windows) EXEC: dos2unix prefix_type.cj
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
        let node = parseFile("prefix_type.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testType01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as PrefixType).getOrThrow()

        @Expect(ty.base is AtomicType)
        @Expect(ty.base.toString(), "Int16")
        @Expect(ty.toString(), "?Int16")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 14]).toArray())
        pos = ty.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
    }

    @TestCase
    func testType02() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as PrefixType).getOrThrow()

        @Expect(ty.base is PrefixType)
        @Expect(ty.base.toString(), "?Int16")
        @Expect(ty.toString(), "??Int16")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 15]).toArray())
        pos = ty.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
    }

    @TestCase
    func testType03() {
        let varDecl = (decls[3] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as PrefixType).getOrThrow()

        @Expect(ty.base is CompositeType)
        @Expect(ty.base.toString(), "String")
        @Expect(ty.toString(), "?String")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 15]).toArray())
        pos = ty.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 9]).toArray())
    }

    @TestCase
    func testType04() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let ty = (funcDecl.retTyAnnotation.getOrThrow() as PrefixType).getOrThrow()

        @Expect(ty.toString(), "?Int16")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 24]).toArray())
        pos = ty.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 19]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("prefix_type.cj")
        let input = String.fromUtf8(File.readFrom("prefix_type.cj"))
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
