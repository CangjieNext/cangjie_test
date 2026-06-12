/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/interface_decl.cj
// (not Windows) EXEC: dos2unix interface_decl.cj
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
        let node = parseFile("interface_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (decls[0] as InterfaceDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "A")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(decl.toString().replace("\r\n", "\n"), "interface A {}")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
        var pos = decl.getInterfaceKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 10]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 11, 1, 12]).toArray())
        @Expect(decl.getGenericParamsLAnglePos().isNone())
        @Expect(decl.getGenericParamsCommasPos().size, 0)
        @Expect(decl.getGenericParamsRAnglePos().isNone())
        @Expect(decl.getUpperBoundPos().isNone())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 0)
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 15]).toArray())
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[1] as InterfaceDecl).getOrThrow()
        @Expect(decl.modifiers.size, 1)
        @Expect(decl.name, "B")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), """
{
    func a(): Int64
}""")
        @Expect(decl.toString().replace("\r\n", "\n"), """
public interface B {
    func a(): Int64
}""")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
    }

    @TestCase
    func testDecl03() {
        let decl = (decls[2] as InterfaceDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "C")
        @Expect(decl.superTyAnnotations.size, 1)
        @Expect(decl.superTyAnnotations[0].toString().replace("\r\n", "\n"), "B")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(decl.toString().replace("\r\n", "\n"), "interface C <: B {}")
    }

    @TestCase
    func testDecl04() {
        let decl = (decls[3] as InterfaceDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "D")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 1)
        @Expect(decl.genericParams[0].name, "T")
        let genericConstraints = decl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 1)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "T <: B")
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(decl.toString().replace("\r\n", "\n"), "interface D<T> where T <: B {}")
    }

    @TestCase
    func testDecl05() {
        let decl = (decls[4] as InterfaceDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "E")
        @Expect(decl.superTyAnnotations.size, 2)
        @Expect(decl.superTyAnnotations[0].toString().replace("\r\n", "\n"), "ToString")
        @Expect(decl.superTyAnnotations[1].toString().replace("\r\n", "\n"), "Inter<S, V>")
        @Expect(decl.genericParams.size, 2)
        @Expect(decl.genericParams[0].name, "S")
        @Expect(decl.genericParams[1].name, "V")
        let genericConstraints = decl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "S <: B")
        @Expect(genericConstraints.constraints[1].toString().replace("\r\n", "\n"), "V <: ToString")
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(decl.toString().replace("\r\n", "\n"), "interface E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}")

        var pos = decl.getInterfaceKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 1, 11, 10]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 11, 11, 12]).toArray())
        pos = decl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 12, 11, 13]).toArray())
        @Expect(decl.getGenericParamsCommasPos().size, 1)
        pos = decl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 14, 11, 15]).toArray())
        pos = decl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 17, 11, 18]).toArray())
        pos = decl.getUpperBoundPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 19, 11, 21]).toArray())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 1)
        pos = decl.getSuperTyAnnotationsBitAndsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 31, 11, 32]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 1, 11, 75]).toArray())
    }

    @TestCase
    func testDecl06() {
        let decl = (decls[5] as InterfaceDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.name, "F")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), """
{
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
        @Expect(decl.toString().replace("\r\n", "\n"), """
interface F {
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
    }

    @TestCase
    func testInterfaceDeclInit() {
        let decl = (decls[4] as InterfaceDecl).getOrThrow()
        let interfaceDecl = InterfaceDecl(decl.body, decl.genericConstraints,
                                        decl.genericParams, decl.name, decl.superTyAnnotations, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(interfaceDecl.modifiers.size, 0)
        @Expect(interfaceDecl.name, "E")
        @Expect(interfaceDecl.superTyAnnotations.size, 2)
        @Expect(interfaceDecl.superTyAnnotations[0].toString().replace("\r\n", "\n"), "ToString")
        @Expect(interfaceDecl.superTyAnnotations[1].toString().replace("\r\n", "\n"), "Inter<S, V>")
        @Expect(interfaceDecl.genericParams.size, 2)
        @Expect(interfaceDecl.genericParams[0].name, "S")
        @Expect(interfaceDecl.genericParams[1].name, "V")
        let genericConstraints = interfaceDecl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 2)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "S <: B")
        @Expect(genericConstraints.constraints[1].toString().replace("\r\n", "\n"), "V <: ToString")
        @Expect(interfaceDecl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(interfaceDecl.toString().replace("\r\n", "\n"), "interface E<S, V> <: ToString & Inter<S, V> where S <: B, V <: ToString {}")

        var pos = interfaceDecl.getInterfaceKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 10]).toArray())
        pos = interfaceDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 11, 1, 12]).toArray())
        pos = interfaceDecl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 12, 1, 13]).toArray())
        @Expect(interfaceDecl.getGenericParamsCommasPos().size, 1)
        pos = interfaceDecl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 14, 1, 15]).toArray())
        pos = interfaceDecl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 17, 1, 18]).toArray())
        pos = interfaceDecl.getUpperBoundPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 19, 1, 21]).toArray())
        @Expect(interfaceDecl.getSuperTyAnnotationsBitAndsPos().size, 1)
        pos = interfaceDecl.getSuperTyAnnotationsBitAndsPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 31, 1, 32]).toArray())
        pos = interfaceDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 75]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("interface_decl.cj")
        let input = String.fromUtf8(File.readFrom("interface_decl.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

