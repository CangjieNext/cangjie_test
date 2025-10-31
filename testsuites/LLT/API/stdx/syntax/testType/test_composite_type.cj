// DEPENDENCE: sourceFile/composite_type.cj
// (not Windows) EXEC: dos2unix composite_type.cj
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
        let node = parseFile("composite_type.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testType01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.typeArguments.size, 0)
        @Expect(ty.name, "A")
        @Expect(ty.prefixes.size, 0)
        @Expect(ty.toString(), "A")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        @Expect(ty.getLAnglePos().isNone())
        @Expect(ty.getRAnglePos().isNone())
        @Expect(ty.getCommasPos().size, 0)
        @Expect(ty.getDotsPos().size, 0)
    }

    @TestCase
    func testType02() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.typeArguments.size, 1)
        @Expect(ty.typeArguments[0] is CompositeType)
        @Expect(ty.typeArguments[0].toString(), "B")
        @Expect(ty.name, "A")
        @Expect(ty.prefixes.size, 0)
        @Expect(ty.toString(), "A<B>")
        @Expect(ty.toTokens().toString(), "A < B >")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 12]).toArray())
        pos = ty.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 3, 10]).toArray())
        pos = ty.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 11, 3, 12]).toArray())
        @Expect(ty.getCommasPos().size, 0)
    }

    @TestCase
    func testType03() {
        let varDecl = (decls[3] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.typeArguments.size, 2)
        @Expect(ty.typeArguments[0] is CompositeType)
        @Expect(ty.typeArguments[1] is CompositeType)
        @Expect(ty.typeArguments[0].toString(), "B")
        @Expect(ty.typeArguments[1].toString(), "C")
        @Expect(ty.name, "A")
        @Expect(ty.prefixes.size, 0)
        @Expect(ty.toString(), "A<B, C>")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 15]).toArray())
        pos = ty.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 9, 4, 10]).toArray())
        pos = ty.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 14, 4, 15]).toArray())
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 11, 4, 12]).toArray())
        @Expect(ty.getCommasPos().size, 1)
    }

    @TestCase
    func testType04() {
        let varDecl = (decls[4] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.typeArguments.size, 1)
        @Expect(ty.typeArguments[0] is AtomicType)
        @Expect(ty.typeArguments[0].toString(), "Int32")
        @Expect(ty.name, "A")
        @Expect(ty.prefixes.size, 0)
        @Expect(ty.toString(), "A<Int32>")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 8, 5, 16]).toArray())
        pos = ty.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 9, 5, 10]).toArray())
        pos = ty.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 15, 5, 16]).toArray())
        @Expect(ty.getCommasPos().size, 0)
    }

    @TestCase
    func testType05() {
        let varDecl = (decls[5] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.typeArguments.size, 3)
        @Expect(ty.typeArguments[0] is CompositeType)
        @Expect(ty.typeArguments[1] is PrefixType)
        @Expect(ty.typeArguments[2] is TupleType)
        @Expect(ty.typeArguments[0].toString(), "String")
        @Expect(ty.typeArguments[1].toString(), "?B")
        @Expect(ty.typeArguments[2].toString(), "((C), T.D)")
        @Expect(ty.name, "A")
        @Expect(ty.prefixes.size, 0)
        @Expect(ty.toString(), "A<String, ?B, ((C), T.D)>")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 8, 6, 33]).toArray())
        pos = ty.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 9, 6, 10]).toArray())
        pos = ty.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 32, 6, 33]).toArray())
        @Expect(ty.getCommasPos().size, 2)
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 16, 6, 17]).toArray())
        pos = ty.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 20, 6, 21]).toArray())
    }

    @TestCase
    func testType06() {
        let varDecl = (decls[6] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.prefixes.size, 1)
        @Expect(ty.prefixes[0], "T")
        @Expect(ty.name, "A")
        @Expect(ty.typeArguments.size, 0)
        @Expect(ty.toString(), "T.A")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 8, 7, 11]).toArray())
        @Expect(ty.getLAnglePos().isNone())
        @Expect(ty.getRAnglePos().isNone())
        @Expect(ty.getCommasPos().size, 0)
        @Expect(ty.getDotsPos().size, 1)
        pos = ty.getDotsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([7, 9, 7, 10]).toArray())
    }

    @TestCase
    func testType07() {
        let varDecl = (decls[7] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.prefixes.size, 2)
        @Expect(ty.prefixes[0], "T")
        @Expect(ty.prefixes[1], "S")
        @Expect(ty.name, "A")
        @Expect(ty.typeArguments.size, 1)
        @Expect(ty.typeArguments[0] is CompositeType)
        @Expect(ty.typeArguments[0].toString(), "T.S.B")
        @Expect(ty.toString(), "T.S.A<T.S.B>")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 8, 8, 20]).toArray())
        pos = ty.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 13, 8, 14]).toArray())
        pos = ty.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 19, 8, 20]).toArray())
        @Expect(ty.getCommasPos().size, 0)
        @Expect(ty.getDotsPos().size, 2)
        pos = ty.getDotsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 9, 8, 10]).toArray())
        pos = ty.getDotsPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 11, 8, 12]).toArray())
    }

    @TestCase
    func testType08() {
        let varDecl = (decls[8] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.prefixes.size, 1)
        @Expect(ty.prefixes[0], "T")
        @Expect(ty.name, "A")
        @Expect(ty.typeArguments.size, 2)
        @Expect(ty.typeArguments[0] is CompositeType)
        @Expect(ty.typeArguments[1] is TupleType)
        @Expect(ty.typeArguments[0].toString(), "T.B")
        @Expect(ty.typeArguments[1].toString(), "(T.C, T.D)")
        @Expect(ty.toString(), "T.A<T.B, (T.C, T.D)>")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 8, 9, 28]).toArray())
        pos = ty.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 11, 9, 12]).toArray())
        pos = ty.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 27, 9, 28]).toArray())
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 15, 9, 16]).toArray())
        @Expect(ty.getCommasPos().size, 1)
        @Expect(ty.getDotsPos().size, 1)
        pos = ty.getDotsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 9, 9, 10]).toArray())
    }

    @TestCase
    func testType09() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let ty = (funcDecl.retTyAnnotation.getOrThrow() as CompositeType).getOrThrow()

        @Expect(ty.toString(), "A<B, C>")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 25]).toArray())
        pos = ty.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 19, 1, 20]).toArray())
        pos = ty.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 24, 1, 25]).toArray())
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 21, 1, 22]).toArray())
        @Expect(ty.getCommasPos().size, 1)
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("composite_type.cj")
        let input = String.fromUtf8(File.readFrom("composite_type.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as CompositeType).getOrThrow()
        let compositeType = CompositeType(ty.name, ty.prefixes, ty.typeArguments)

        @Expect(compositeType.typeArguments.size, 1)
        @Expect(compositeType.typeArguments[0] is CompositeType)
        @Expect(compositeType.typeArguments[0].toString(), "B")
        @Expect(compositeType.name, "A")
        @Expect(compositeType.prefixes.size, 0)
        @Expect(compositeType.toString(), "A<B>")

        var pos = compositeType.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())
        pos = compositeType.getLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 2, 1, 3]).toArray())
        pos = compositeType.getRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 4, 1, 5]).toArray())
        @Expect(compositeType.getCommasPos().size, 0)
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
