// DEPENDENCE: sourceFile/struct_decl.cj
// (not Windows) EXEC: dos2unix struct_decl.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("struct_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (decls[0] as StructDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "A")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), "{}")
        @Expect(decl.toString(), "struct A {}")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString(), decl.toString())
        var pos = decl.getStructKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 9]).toArray())
        @Expect(decl.getGenericParamsLAnglePos().isNone())
        @Expect(decl.getGenericParamsCommasPos().size, 0)
        @Expect(decl.getGenericParamsRAnglePos().isNone())
        @Expect(decl.getUpperBoundPos().isNone())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 0)
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[1] as StructDecl).getOrThrow()
        @Expect(decl.modifiers.size, 1)
        @Expect(decl.name, "B")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    var a = 1
}""")
        @Expect(decl.toString(), """
public struct B {
    var a = 1
}""")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString(), decl.toString())
    }

    @TestCase
    func testDecl03() {
        let decl = (decls[2] as StructDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "C")
        @Expect(decl.superTyAnnotations.size, 1)
        @Expect(decl.superTyAnnotations[0].toString(), "B")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), "{}")
        @Expect(decl.toString(), "struct C <: B {}")
    }

    @TestCase
    func testDecl04() {
        let decl = (decls[3] as StructDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "D")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 1)
        @Expect(decl.genericParams[0].name, "T")
        let genericConstraints =  decl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 1)
        @Expect(genericConstraints.constraints[0].toString(), "T <: B")
        @Expect(decl.body.toString(), "{}")
        @Expect(decl.toString(), "struct D<T> where T <: B {}")
    }

    @TestCase
    func testDecl05() {
        let decl = (decls[4] as StructDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "E")
        @Expect(decl.superTyAnnotations.size, 2)
        @Expect(decl.superTyAnnotations[0].toString(), "ToString")
        @Expect(decl.superTyAnnotations[1].toString(), "Inter<S, V>")
        @Expect(decl.genericParams.size, 2)
        @Expect(decl.genericParams[0].name, "S")
        @Expect(decl.genericParams[1].name, "V")
        let genericConstraints =  decl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.constraints[0].toString(), "S <: B")
        @Expect(genericConstraints.constraints[1].toString(), "V <: ToString")
        @Expect(decl.body.toString(), "{}")
        @Expect(decl.toString(), "struct E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}")

        var pos = decl.getStructKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 1, 11, 7]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 8, 11, 9]).toArray())
        pos = decl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 9, 11, 10]).toArray())
        @Expect(decl.getGenericParamsCommasPos().size, 1)
        pos = decl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 11, 11, 12]).toArray())
        pos = decl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 14, 11, 15]).toArray())
        pos = decl.getUpperBoundPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 16, 11, 18]).toArray())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 1)
        pos = decl.getSuperTyAnnotationsBitAndsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 28, 11, 29]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 1, 11, 72]).toArray())
    }

    @TestCase
    func testDecl06() {
        let decl = (decls[5] as StructDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "F")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString(), """
{
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString(), """
struct F {
    let a = 1
    var b: Int64

    init() {
        b = 4
    }

    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
    }

    @TestCase
    func testStructDeclInit() {
        let decl = (decls[4] as StructDecl).getOrThrow()
        let structDecl = StructDecl(decl.body, decl.genericConstraints,
                                        decl.genericParams, decl.name, decl.superTyAnnotations, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(structDecl.modifiers.size, 0)
        @Expect(structDecl.name, "E")
        @Expect(structDecl.superTyAnnotations.size, 2)
        @Expect(structDecl.superTyAnnotations[0].toString(), "ToString")
        @Expect(structDecl.superTyAnnotations[1].toString(), "Inter<S, V>")
        @Expect(structDecl.genericParams.size, 2)
        @Expect(structDecl.genericParams[0].name, "S")
        @Expect(structDecl.genericParams[1].name, "V")
        let genericConstraints = structDecl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.constraints[0].toString(), "S <: B")
        @Expect(genericConstraints.constraints[1].toString(), "V <: ToString")
        @Expect(structDecl.body.toString(), "{}")
        @Expect(structDecl.toString(), "struct E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}")

        var pos = structDecl.getStructKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        pos = structDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 8, 1, 9]).toArray())
        pos = structDecl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 9, 1, 10]).toArray())
        @Expect(structDecl.getGenericParamsCommasPos().size, 1)
        pos = structDecl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 11, 1, 12]).toArray())
        pos = structDecl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = structDecl.getUpperBoundPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 16, 1, 18]).toArray())
        @Expect(structDecl.getSuperTyAnnotationsBitAndsPos().size, 1)
        pos = structDecl.getSuperTyAnnotationsBitAndsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 28, 1, 29]).toArray())
        pos = structDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 72]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("struct_decl.cj")
        let input = String.fromUtf8(File.readFrom("struct_decl.cj"))
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
