/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/tuple_type.cj
// (not Windows) EXEC: dos2unix tuple_type.cj
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
        let node = parseFile("tuple_type.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testType01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as TupleType).getOrThrow()

        @Expect(ty.elements.size, 2)
        @Expect(ty.elements[0] is AtomicType)
        @Expect(ty.elements[1] is AtomicType)
        @Expect(ty.elements[0].toString().replace("\r\n", "\n"), "Int16")
        @Expect(ty.elements[1].toString().replace("\r\n", "\n"), "Int32")
        @Expect(ty.labels.size, 0)
        @Expect(ty.toString().replace("\r\n", "\n"), "(Int16, Int32)")
        @Expect(ty.toTokens().toString().replace("\r\n", "\n"), "(Int16, Int32)")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 22]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 21, 2, 22]).toArray())
        @Expect(ty.getCommasPos().size, 1)
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 14, 2, 15]).toArray())
        @Expect(ty.getLabelsPos().size, 0)
        @Expect(ty.getColonsPos().size, 0)
    }

    @TestCase
    func testType02() {
        let varDecl = (decls[2] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as TupleType).getOrThrow()

        @Expect(ty.elements.size, 3)
        @Expect(ty.elements[0] is AtomicType)
        @Expect(ty.elements[1] is PrefixType)
        @Expect(ty.elements[2] is TupleType)
        @Expect(ty.elements[0].toString().replace("\r\n", "\n"), "Int16")
        @Expect(ty.elements[1].toString().replace("\r\n", "\n"), "?Int32")
        @Expect(ty.elements[2].toString().replace("\r\n", "\n"), "(Int32, Int32)")
        @Expect(ty.labels.size, 0)
        @Expect(ty.toString().replace("\r\n", "\n"), "(Int16, ?Int32, (Int32, Int32))")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 39]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 8, 3, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 38, 3, 39]).toArray())
        @Expect(ty.getCommasPos().size, 2)
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 14, 3, 15]).toArray())
        pos = ty.getCommasPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 22, 3, 23]).toArray())
        @Expect(ty.getLabelsPos().size, 0)
        @Expect(ty.getColonsPos().size, 0)
    }

    @TestCase
    func testType03() {
        let varDecl = (decls[3] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as TupleType).getOrThrow()

        @Expect(ty.elements.size, 2)
        @Expect(ty.elements[0] is AtomicType)
        @Expect(ty.elements[1] is CompositeType)
        @Expect(ty.elements[0].toString().replace("\r\n", "\n"), "Int16")
        @Expect(ty.elements[1].toString().replace("\r\n", "\n"), "String")
        @Expect(ty.labels.size, 2)
        @Expect(ty.labels[0], "x")
        @Expect(ty.labels[1], "y")
        @Expect(ty.toString().replace("\r\n", "\n"), "(x: Int16, y: String)")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 29]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 9]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 28, 4, 29]).toArray())
        @Expect(ty.getCommasPos().size, 1)
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 17, 4, 18]).toArray())
        @Expect(ty.getLabelsPos().size, 2)
        pos = ty.getLabelsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 9, 4, 10]).toArray())
        pos = ty.getLabelsPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 19, 4, 20]).toArray())
        @Expect(ty.getColonsPos().size, 2)
        pos = ty.getColonsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 10, 4, 11]).toArray())
        pos = ty.getColonsPos()[1]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 20, 4, 21]).toArray())
    }

    @TestCase
    func testType04() {
        let funcDecl = (decls[0] as FuncDecl).getOrThrow()
        let ty = (funcDecl.retTyAnnotation.getOrThrow() as TupleType).getOrThrow()

        @Expect(ty.toString().replace("\r\n", "\n"), "(a: Int64, b: Int64)")

        var pos = ty.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 38]).toArray())
        pos = ty.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 18, 1, 19]).toArray())
        pos = ty.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 37, 1, 38]).toArray())
        pos = ty.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 27, 1, 28]).toArray())
        pos = ty.getLabelsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 19, 1, 20]).toArray())
        pos = ty.getColonsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 20, 1, 21]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("tuple_type.cj")
        let input = String.fromUtf8(File.readFrom("tuple_type.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }

    @TestCase
    func testInit01() {
        let varDecl = (decls[1] as VarDecl).getOrThrow()
        let ty = (varDecl.tyAnnotation.getOrThrow() as TupleType).getOrThrow()
        let tupleType = TupleType(ty.labels, ty.elements)

        @Expect(tupleType.elements.size, 2)
        @Expect(tupleType.elements[0] is AtomicType)
        @Expect(tupleType.elements[1] is AtomicType)
        @Expect(tupleType.elements[0].toString().replace("\r\n", "\n"), "Int16")
        @Expect(tupleType.elements[1].toString().replace("\r\n", "\n"), "Int32")
        @Expect(tupleType.labels.size, 0)
        @Expect(tupleType.toString().replace("\r\n", "\n"), "(Int16, Int32)")

        var pos = tupleType.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 15]).toArray())
        pos = tupleType.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 2]).toArray())
        pos = tupleType.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        @Expect(tupleType.getCommasPos().size, 1)
        pos = tupleType.getCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 7, 1, 8]).toArray())
        @Expect(tupleType.getLabelsPos().size, 0)
        @Expect(tupleType.getColonsPos().size, 0)
    }

    @TestCase
    func testInit02() {
        @AssertThrows[Exception](TupleType([], []))
    }
}