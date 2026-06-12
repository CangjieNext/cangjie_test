/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/extend_decl.cj
// (not Windows) EXEC: dos2unix extend_decl.cj
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
        let node = parseFile("extend_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        decls = file.topLevelDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (decls[0] as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString().replace("\r\n", "\n"), "A")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(decl.toString().replace("\r\n", "\n"), "extend A {}")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
        var pos = decl.getExtendKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 7]).toArray())
        @Expect(decl.getGenericParamsLAnglePos().isNone())
        @Expect(decl.getGenericParamsCommasPos().size, 0)
        @Expect(decl.getGenericParamsRAnglePos().isNone())
        @Expect(decl.getUpperBoundPos().isNone())
        @Expect(decl.getSuperTyAnnotationsBitAndsPos().size, 0)
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 12]).toArray())
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[1] as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString().replace("\r\n", "\n"), "B")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), """
{
    func a() {}
}""")
        @Expect(decl.toString().replace("\r\n", "\n"), """
extend B {
    func a() {}
}""")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString().replace("\r\n", "\n"), decl.toString().replace("\r\n", "\n"))
    }

    @TestCase
    func testDecl03() {
        let decl = (decls[2] as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString().replace("\r\n", "\n"), "C")
        @Expect(decl.superTyAnnotations.size, 1)
        @Expect(decl.superTyAnnotations[0].toString().replace("\r\n", "\n"), "B")
        @Expect(decl.genericParams.size, 0)
        @Expect(decl.genericConstraints.isNone())
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(decl.toString().replace("\r\n", "\n"), "extend C <: B {}")
    }

    @TestCase
    func testDecl04() {
        let decl = (decls[3] as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString().replace("\r\n", "\n"), "D")
        @Expect(decl.superTyAnnotations.size, 0)
        @Expect(decl.genericParams.size, 1)
        @Expect(decl.genericParams[0].name, "T")
        let genericConstraints = decl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 1)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "T <: B")
        @Expect(decl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(decl.toString().replace("\r\n", "\n"), "extend<T> D where T <: B {}")
    }

    @TestCase
    func testDecl05() {
        let decl = (decls[4] as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString().replace("\r\n", "\n"), "E")
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
        @Expect(decl.toString().replace("\r\n", "\n"), "extend<S, V> E <: ToString & Inter<S, V> where S <: B, V <: ToString {}")

        var pos = decl.getExtendKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 1, 11, 7]).toArray())
        pos = decl.getGenericParamsLAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 7, 11, 8]).toArray())
        @Expect(decl.getGenericParamsCommasPos().size, 1)
        pos = decl.getGenericParamsCommasPos()[0]
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 9, 11, 10]).toArray())
        pos = decl.getGenericParamsRAnglePos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([11, 12, 11, 13]).toArray())
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
        let decl = (decls[5] as ExtendDecl).getOrThrow()
        @Expect(decl.modifiers.size, 0)
        @Expect(decl.extendedTyAnnotation.toString().replace("\r\n", "\n"), "F")
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
extend F {
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}""")
    }

    @TestCase
    func testExtendDeclInit() {
        let decl = (decls[3] as ExtendDecl).getOrThrow()
        let extendDecl = ExtendDecl(decl.body,
                                    decl.extendedTyAnnotation, decl.genericConstraints, decl.genericParams,
                                    decl.superTyAnnotations, annotations: decl.annotations)
        @Expect(extendDecl.modifiers.size, 0)
        @Expect(extendDecl.extendedTyAnnotation.toString().replace("\r\n", "\n"), "D")
        @Expect(extendDecl.superTyAnnotations.size, 0)
        @Expect(extendDecl.genericParams.size, 1)
        @Expect(extendDecl.genericParams[0].name, "T")
        let genericConstraints = extendDecl.genericConstraints.getOrThrow()
        @Expect(genericConstraints.constraints.size, 1)
        @Expect(genericConstraints.constraints[0].toString().replace("\r\n", "\n"), "T <: B")
        @Expect(extendDecl.body.toString().replace("\r\n", "\n"), "{}")
        @Expect(extendDecl.toString().replace("\r\n", "\n"), "extend<T> D where T <: B {}")
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("extend_decl.cj")
        let input = String.fromUtf8(File.readFrom("extend_decl.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}

